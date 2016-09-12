require 'rails_helper'

RSpec.describe IncommingInvoicesController, type: :controller do

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
    @exchange_rate = ExchangeRate.create!(rate: '0.123', date: '2016-09-08', bank_id: @bank.id, currency_id: @currency.id, user_id: @user.id)
    @trade_subject = TradeSubject.create!(name: 'test_trade_subject_name', identification_number: '123', vat: 'test_trade_subject_vat', user_id: @user.id)
    @incomming_invoice_sequence = IncommingInvoiceSequence.create!(name: 'test_incomming_invoice_sequence_name', note: 'test_incomming_invoice_sequence_note', user_id: @user.id)
    @incomming_invoice = IncommingInvoice.create!(number: '123', generated_on_date: '2016-03-04', taxable_supply_date: '2016-04-05', due_date: '2016-05-06', total_computed_base: '123', total_computed_vat: '234', total_corrected_base: '345', total_corrected_vat: '456', reverse_charge: true, paid: true, note: 'test_incomming_invoice_note', incomming_invoice_sequence_id: @incomming_invoice_sequence.id, trade_subject_id: @trade_subject.id, currency_id: @currency.id, exchange_rate_id: @exchange_rate.id, user_id: @user.id)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: @incomming_invoice.id
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
      get :edit, id: @incomming_invoice.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, incomming_invoice: { "number"=>@incomming_invoice.number, "generated_on_date"=>@incomming_invoice.generated_on_date, "taxable_supply_date"=>@incomming_invoice.taxable_supply_date, "due_date"=>@incomming_invoice.due_date, "total_computed_base"=>@incomming_invoice.total_computed_base, "total_computed_vat"=>@incomming_invoice.total_computed_vat, "total_corrected_base"=>@incomming_invoice.total_corrected_base, "total_corrected_vat"=>@incomming_invoice.total_corrected_vat, "reverse_charge"=>@incomming_invoice.reverse_charge, "paid"=>@incomming_invoice.paid, "note"=>@incomming_invoice.note, "incomming_invoice_sequence_id"=>@incomming_invoice.incomming_invoice_sequence_id, "trade_subject_id"=>@incomming_invoice.trade_subject_id, "currency_id"=>@incomming_invoice.currency_id, "exchange_rate_id"=>@incomming_invoice.exchange_rate_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      put :update, id: @incomming_invoice.id, incomming_invoice: { "number"=>@incomming_invoice.number, "generated_on_date"=>@incomming_invoice.generated_on_date, "taxable_supply_date"=>@incomming_invoice.taxable_supply_date, "due_date"=>@incomming_invoice.due_date, "total_computed_base"=>@incomming_invoice.total_computed_base, "total_computed_vat"=>@incomming_invoice.total_computed_vat, "total_corrected_base"=>@incomming_invoice.total_corrected_base, "total_corrected_vat"=>@incomming_invoice.total_corrected_vat, "reverse_charge"=>@incomming_invoice.reverse_charge, "paid"=>@incomming_invoice.paid, "note"=>@incomming_invoice.note, "incomming_invoice_sequence_id"=>@incomming_invoice.incomming_invoice_sequence_id, "trade_subject_id"=>@incomming_invoice.trade_subject_id, "currency_id"=>@incomming_invoice.currency_id, "exchange_rate_id"=>@incomming_invoice.exchange_rate_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, id: @incomming_invoice.id
      expect(response).to have_http_status(:found)
    end
  end

end