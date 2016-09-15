require 'rails_helper'

RSpec.describe "outgoing_invoice_payments/show.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:outgoing_invoice_payment) {FactoryGirl.create(:outgoing_invoice_payment)}

  before do
    sign_in user
  end

  it "shows Outgoing invoice payment with id: as parameter" do

    controller.extra_params = { :id => outgoing_invoice_payment.id }
    expect(controller.request.fullpath).to eq outgoing_invoice_payment_path(outgoing_invoice_payment)
  end  
end
