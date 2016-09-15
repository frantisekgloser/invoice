require 'rails_helper'

RSpec.describe "outgoing_invoices/show.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:outgoing_invoice) {FactoryGirl.create(:outgoing_invoice)}

  before do
    sign_in user
  end

  it "shows Outgoing invoice with id: as parameter" do

    controller.extra_params = { :id => outgoing_invoice.id }
    expect(controller.request.fullpath).to eq outgoing_invoice_path(outgoing_invoice)
  end  
end
