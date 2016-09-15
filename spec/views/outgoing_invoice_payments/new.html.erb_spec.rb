require 'rails_helper'

RSpec.describe "outgoing_invoice_payments/new.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "builds new Outgoing invoice payment" do

    expect(controller.request.fullpath).to eq new_outgoing_invoice_payment_path
  end  
end
