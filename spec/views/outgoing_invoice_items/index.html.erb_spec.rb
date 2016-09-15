require 'rails_helper'

RSpec.describe "outgoing_invoice_items/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:outgoing_invoice) {FactoryGirl.create(:outgoing_invoice)}

  before do
    sign_in user
  end

  it "shows index of Outgoing invoice items" do

    controller.extra_params = { :outgoing_invoice_id => outgoing_invoice.id }
    expect(controller.request.fullpath).to eq outgoing_invoice_outgoing_invoice_items_path(outgoing_invoice)
  end  
end
