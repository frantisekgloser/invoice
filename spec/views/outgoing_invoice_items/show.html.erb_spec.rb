require 'rails_helper'

RSpec.describe "outgoing_invoice_items/show.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:outgoing_invoice) {FactoryGirl.create(:outgoing_invoice)}
  let(:outgoing_invoice_item) {FactoryGirl.create(:outgoing_invoice_item)}

  before do
    sign_in user
  end

  it "shows Outgoing invoice item with id: as parameter" do

    controller.extra_params = { :outgoing_invoice_id=>outgoing_invoice.id, :id=>outgoing_invoice_item.id }
    expect(controller.request.fullpath).to eq outgoing_invoice_outgoing_invoice_item_path(outgoing_invoice, outgoing_invoice_item)
  end  
end
