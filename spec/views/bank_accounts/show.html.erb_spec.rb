require 'rails_helper'

RSpec.describe "bank_accounts/show.html.erb", type: :view do

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    
    if User.where(:email ==  "test@test.com") == []
      @user = User.create!(email: 'test@test.com', password: '12test34', trade_subject: 'test', identification_number: '123', house_number: 1, city: 'test_city', postal_code: '123', country: 'test_country')
    else
      @user = User.where(:email ==  "test@test.com")
    end

    sign_in @user
    @bank = Bank.create!(name: 'test_bank', code: 'test_bank_code', user_id: @user.id)
    @currency = Currency.create!(name: 'test_currency', user_id: @user.id)
    @bank_account = BankAccount.create!(name: 'test_bank_account_name', number: '123', iban: 'test_iban', bank_id: @bank.id, currency_id: @currency.id, user_id: @user.id)
  end

  it "shows Bank account with id: as parameter" do

    controller.extra_params = { :id=>@bank_account.id }
    expect(controller.request.fullpath).to eq bank_account_path(@bank_account)
  end  
end
