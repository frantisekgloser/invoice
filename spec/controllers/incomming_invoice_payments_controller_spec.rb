require 'rails_helper'

RSpec.describe IncommingInvoicePaymentsController, type: :controller do

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
    @incomming_invoice_sequence = IncommingInvoiceSequence.create!(name: 'test_incomming_invoice_sequence_name', note: 'test_incomming_invoice_sequence_note', user_id: @user.id)
    @incomming_invoice = IncommingInvoice.create!(number: '123', generated_on_date: '2016-03-04', taxable_supply_date: '2016-04-05', due_date: '2016-05-06', total_computed_base: '123', total_computed_vat: '234', total_corrected_base: '345', total_corrected_vat: '456', reverse_charge: true, paid: true, note: 'test_incomming_invoice_note', incomming_invoice_sequence_id: @incomming_invoice_sequence.id, trade_subject_id: @trade_subject.id, currency_id: @currency.id, exchange_rate_id: @exchange_rate.id, user_id: @user.id)
    @payment_type = PaymentType.create!(name: 'test_payment_type_name', user_id: @user.id)
    @income_report = IncomeReport.create!(number: '123', date: '2016-02-03', to_pay: '123', to_receive: '321', note: 'test_income_report_note', user_id: @user.id)
    @vat_report = VatReport.create!(number: '123', date: '2016-02-03', to_pay: '123', to_receive: '321', note: 'test_vat_report_note', user_id: @user.id)
    @payment = Payment.create!(date: '2016-06-07', amount: '123', note: 'test_payment_note', payment_type_id: @payment_type.id, currency_id: @currency.id, bank_account_id: @bank_account.id, trade_subject_id: @trade_subject.id, vat_report_id: @vat_report.id, income_report_id: @income_report.id, user_id: @user.id)
    @incomming_invoice_payment = IncommingInvoicePayment.create!(amount: '123', payment_id: @payment.id, incomming_invoice_id: @incomming_invoice.id, exchange_rate_id: @exchange_rate.id, user_id: @user.id)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: @incomming_invoice_payment.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: @incomming_invoice_payment.id
      expect(response).to have_http_status(:success)
    end
  end

    describe "POST #create" do
    it "returns http success" do
      post :create, incomming_invoice_payment: { "amount"=>@incomming_invoice_payment.amount, "payment_id"=>@incomming_invoice_payment.payment_id, "incomming_invoice_id"=>@incomming_invoice_payment.incomming_invoice_id, "exchange_rate_id"=>@incomming_invoice_payment.exchange_rate_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      put :update, id: @incomming_invoice_payment.id, incomming_invoice_payment: { "amount"=>@incomming_invoice_payment.amount, "payment_id"=>@incomming_invoice_payment.payment_id, "incomming_invoice_id"=>@incomming_invoice_payment.incomming_invoice_id, "exchange_rate_id"=>@incomming_invoice_payment.exchange_rate_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, id: @incomming_invoice_payment.id
      expect(response).to have_http_status(:found)
    end
  end

end