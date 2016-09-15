require 'rails_helper'

RSpec.describe "bank_accounts/new.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "builds new Bank account" do

    expect(controller.request.fullpath).to eq new_bank_account_path
  end  
end
