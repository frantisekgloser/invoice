require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}
  let(:payment) {FactoryGirl.create(:payment)}

  before do
    sign_in user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: payment.id
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
      get :edit, id: payment.id
      expect(response).to have_http_status(:success)
    end
  end

    describe "POST #create" do
    it "returns http success" do
      post :create, payment: { "date"=>payment.date, "amount"=>payment.amount, "note"=>payment.note, "payment_type_id"=>payment.payment_type_id, "currency_id"=>payment.currency_id, "bank_account_id"=>payment.bank_account_id, "trade_subject_id"=>payment.trade_subject_id, "vat_report_id"=>payment.vat_report_id, "income_report_id"=>payment.income_report_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      put :update, id: payment.id, payment: { "date"=>payment.date, "amount"=>payment.amount, "note"=>payment.note, "payment_type_id"=>payment.payment_type_id, "currency_id"=>payment.currency_id, "bank_account_id"=>payment.bank_account_id, "trade_subject_id"=>payment.trade_subject_id, "vat_report_id"=>payment.vat_report_id, "income_report_id"=>payment.income_report_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, id: payment.id
      expect(response).to have_http_status(:found)
    end
  end

end