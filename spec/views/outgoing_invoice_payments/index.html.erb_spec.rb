require 'rails_helper'

RSpec.describe "outgoing_invoice_payments/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "shows index of Outgoing invoice payments" do

    expect(controller.request.fullpath).to eq outgoing_invoice_payments_path
  end  
end
