require 'rails_helper'

RSpec.describe "payments/new.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "builds new Payment" do

    expect(controller.request.fullpath).to eq new_payment_path
  end  
end
