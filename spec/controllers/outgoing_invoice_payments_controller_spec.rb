require 'rails_helper'

RSpec.describe OutgoingInvoicePaymentsController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}
  let(:outgoing_invoice_payment) {FactoryGirl.create(:outgoing_invoice_payment)}

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
      get :show, id: outgoing_invoice_payment.id
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
      get :edit, id: outgoing_invoice_payment.id
      expect(response).to have_http_status(:success)
    end
  end

    describe "POST #create" do
    it "returns http success" do
      post :create, outgoing_invoice_payment: { "amount"=>outgoing_invoice_payment.amount, "payment_id"=>outgoing_invoice_payment.payment_id, "outgoing_invoice_id"=>outgoing_invoice_payment.outgoing_invoice_id, "exchange_rate_id"=>outgoing_invoice_payment.exchange_rate_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      put :update, id: outgoing_invoice_payment.id, outgoing_invoice_payment: { "amount"=>outgoing_invoice_payment.amount, "payment_id"=>outgoing_invoice_payment.payment_id, "outgoing_invoice_id"=>outgoing_invoice_payment.outgoing_invoice_id, "exchange_rate_id"=>outgoing_invoice_payment.exchange_rate_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, id: outgoing_invoice_payment.id
      expect(response).to have_http_status(:found)
    end
  end

end