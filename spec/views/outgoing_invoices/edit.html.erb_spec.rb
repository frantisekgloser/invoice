require 'rails_helper'

RSpec.describe "outgoing_invoices/edit.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:outgoing_invoice) {FactoryGirl.create(:outgoing_invoice)}

  before do
    sign_in user
  end

  it "edits Outgoing invoice with id: as parameter" do

    controller.extra_params = { :id => outgoing_invoice.id }
    expect(controller.request.fullpath).to eq edit_outgoing_invoice_path(outgoing_invoice)
  end  
end
