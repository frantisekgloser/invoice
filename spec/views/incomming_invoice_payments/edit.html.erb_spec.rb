require 'rails_helper'

RSpec.describe "incomming_invoice_payments/edit.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:incomming_invoice_payment) {FactoryGirl.create(:incomming_invoice_payment)}

  before do
    sign_in user
  end

  it "edits Incomming invoice payment with id: as parameter" do

    controller.extra_params = { :id => incomming_invoice_payment.id }
    expect(controller.request.fullpath).to eq edit_incomming_invoice_payment_path(incomming_invoice_payment)
  end  
end
