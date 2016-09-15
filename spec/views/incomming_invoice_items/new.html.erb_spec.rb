require 'rails_helper'

RSpec.describe "incomming_invoice_items/new.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:incomming_invoice) {FactoryGirl.create(:incomming_invoice)}

  before do
    sign_in user
  end

  it "builds new Incomming invoice item" do

    controller.extra_params = { :incomming_invoice_id=>incomming_invoice.id }
    expect(controller.request.fullpath).to eq new_incomming_invoice_incomming_invoice_item_path(incomming_invoice)
  end  
end
