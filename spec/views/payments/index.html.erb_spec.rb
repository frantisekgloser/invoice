require 'rails_helper'

RSpec.describe "payments/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "shows index of Payments" do

    expect(controller.request.fullpath).to eq payments_path
  end  
end
