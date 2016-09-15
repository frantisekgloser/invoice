require 'rails_helper'

RSpec.describe "incomming_invoice_items/edit.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:incomming_invoice) {FactoryGirl.create(:incomming_invoice)}
  let(:incomming_invoice_item) {FactoryGirl.create(:incomming_invoice_item)}

  before do
    sign_in user
  end

  it "edits Incomming invoice item with id: as parameter" do

    controller.extra_params = { :incomming_invoice_id=>incomming_invoice.id, :id=>incomming_invoice_item.id }
    expect(controller.request.fullpath).to eq edit_incomming_invoice_incomming_invoice_item_path(incomming_invoice, incomming_invoice_item)
  end  
end
