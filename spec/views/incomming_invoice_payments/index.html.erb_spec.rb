require 'rails_helper'

RSpec.describe "incomming_invoice_payments/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "shows index of Incomming invoice payments" do

    expect(controller.request.fullpath).to eq incomming_invoice_payments_path
  end  
end
