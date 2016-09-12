require 'rails_helper'

RSpec.describe "payments/edit.html.erb", type: :view do

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    
    if User.where(:email ==  "test@test.com") == []
      @user = User.create!(email: 'test@test.com', password: '12test34', trade_subject: 'test', identification_number: '123', house_number: 1, city: 'test_city', postal_code: '123', country: 'test_country')
    else
      @user = User.where(:email ==  "test@test.com")
    end

    sign_in @user
    @currency = Currency.create!(name: 'test_currency', user_id: @user.id)
    @bank = Bank.create!(name: 'test_bank', code: 'test_bank_code', user_id: @user.id)
    @bank_account = BankAccount.create!(name: 'test_bank_account_name', number: '123', iban: 'test_iban', bank_id: @bank.id, currency_id: @currency.id, user_id: @user.id)
    @exchange_rate = ExchangeRate.create!(rate: '0.123', date: '2016-09-08', bank_id: @bank.id, currency_id: @currency.id, user_id: @user.id)
    @trade_subject = TradeSubject.create!(name: 'test_trade_subject_name', identification_number: '123', vat: 'test_trade_subject_vat', user_id: @user.id)
    @payment_type = PaymentType.create!(name: 'test_payment_type_name', user_id: @user.id)
    @income_report = IncomeReport.create!(number: '123', date: '2016-02-03', to_pay: '123', to_receive: '321', note: 'test_income_report_note', user_id: @user.id)
    @vat_report = VatReport.create!(number: '123', date: '2016-02-03', to_pay: '123', to_receive: '321', note: 'test_vat_report_note', user_id: @user.id)
    @payment = Payment.create!(date: '2016-06-07', amount: '123', note: 'test_payment_note', payment_type_id: @payment_type.id, currency_id: @currency.id, bank_account_id: @bank_account.id, trade_subject_id: @trade_subject.id, vat_report_id: @vat_report.id, income_report_id: @income_report.id, user_id: @user.id)
  end

  it "edits Payment with id: as parameter" do

    controller.extra_params = { :id => @payment.id }
    expect(controller.request.fullpath).to eq edit_payment_path(@payment)
  end  
end
