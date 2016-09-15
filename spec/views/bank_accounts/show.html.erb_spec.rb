require 'rails_helper'

RSpec.describe "bank_accounts/show.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:bank_account) {FactoryGirl.create(:bank_account)}

  before do
    sign_in user
  end

  it "shows Bank account with id: as parameter" do

    controller.extra_params = { :id=>bank_account.id }
    expect(controller.request.fullpath).to eq bank_account_path(bank_account)
  end  
end
