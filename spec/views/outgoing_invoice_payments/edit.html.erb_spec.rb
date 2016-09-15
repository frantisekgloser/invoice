require 'rails_helper'

RSpec.describe "outgoing_invoice_payments/edit.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:outgoing_invoice_payment) {FactoryGirl.create(:outgoing_invoice_payment)}

  before do
    sign_in user
  end

  it "edits Outgoing invoice payment with id: as parameter" do

    controller.extra_params = { :id => outgoing_invoice_payment.id }
    expect(controller.request.fullpath).to eq edit_outgoing_invoice_payment_path(outgoing_invoice_payment)
  end  
end
