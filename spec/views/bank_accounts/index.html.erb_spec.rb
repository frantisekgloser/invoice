require 'rails_helper'

RSpec.describe "bank_accounts/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "shows index of Bank accounts" do

    expect(controller.request.fullpath).to eq bank_accounts_path
  end  
end
