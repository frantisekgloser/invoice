require 'rails_helper'

RSpec.describe IncommingInvoicesController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}
  let(:incomming_invoice) {FactoryGirl.create(:incomming_invoice)}

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
      get :show, id: incomming_invoice.id
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
      get :edit, id: incomming_invoice.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, incomming_invoice: { "number"=>incomming_invoice.number, "generated_on_date"=>incomming_invoice.generated_on_date, "taxable_supply_date"=>incomming_invoice.taxable_supply_date, "due_date"=>incomming_invoice.due_date, "total_computed_base"=>incomming_invoice.total_computed_base, "total_computed_vat"=>incomming_invoice.total_computed_vat, "total_corrected_base"=>incomming_invoice.total_corrected_base, "total_corrected_vat"=>incomming_invoice.total_corrected_vat, "reverse_charge"=>incomming_invoice.reverse_charge, "paid"=>incomming_invoice.paid, "note"=>incomming_invoice.note, "incomming_invoice_sequence_id"=>incomming_invoice.incomming_invoice_sequence_id, "trade_subject_id"=>incomming_invoice.trade_subject_id, "currency_id"=>incomming_invoice.currency_id, "exchange_rate_id"=>incomming_invoice.exchange_rate_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      put :update, id: incomming_invoice.id, incomming_invoice: { "number"=>incomming_invoice.number, "generated_on_date"=>incomming_invoice.generated_on_date, "taxable_supply_date"=>incomming_invoice.taxable_supply_date, "due_date"=>incomming_invoice.due_date, "total_computed_base"=>incomming_invoice.total_computed_base, "total_computed_vat"=>incomming_invoice.total_computed_vat, "total_corrected_base"=>incomming_invoice.total_corrected_base, "total_corrected_vat"=>incomming_invoice.total_corrected_vat, "reverse_charge"=>incomming_invoice.reverse_charge, "paid"=>incomming_invoice.paid, "note"=>incomming_invoice.note, "incomming_invoice_sequence_id"=>incomming_invoice.incomming_invoice_sequence_id, "trade_subject_id"=>incomming_invoice.trade_subject_id, "currency_id"=>incomming_invoice.currency_id, "exchange_rate_id"=>incomming_invoice.exchange_rate_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, id: incomming_invoice.id
      expect(response).to have_http_status(:found)
    end
  end

end