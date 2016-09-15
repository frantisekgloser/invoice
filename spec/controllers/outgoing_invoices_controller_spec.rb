require 'rails_helper'

RSpec.describe OutgoingInvoicesController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}
  let(:outgoing_invoice) {FactoryGirl.create(:outgoing_invoice)}

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
      get :show, id: outgoing_invoice.id
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
      get :edit, id: outgoing_invoice.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, outgoing_invoice: { "number"=>outgoing_invoice.number, "generated_on_date"=>outgoing_invoice.generated_on_date, "taxable_supply_date"=>outgoing_invoice.taxable_supply_date, "due_date"=>outgoing_invoice.due_date, "total_computed_base"=>outgoing_invoice.total_computed_base, "total_computed_vat"=>outgoing_invoice.total_computed_vat, "total_corrected_base"=>outgoing_invoice.total_corrected_base, "total_corrected_vat"=>outgoing_invoice.total_corrected_vat, "reverse_charge"=>outgoing_invoice.reverse_charge, "paid"=>outgoing_invoice.paid, "note"=>outgoing_invoice.note, "outgoing_invoice_sequence_id"=>outgoing_invoice.outgoing_invoice_sequence_id, "trade_subject_id"=>outgoing_invoice.trade_subject_id, "currency_id"=>outgoing_invoice.currency_id, "exchange_rate_id"=>outgoing_invoice.exchange_rate_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      put :update, id: outgoing_invoice.id, outgoing_invoice: { "number"=>outgoing_invoice.number, "generated_on_date"=>outgoing_invoice.generated_on_date, "taxable_supply_date"=>outgoing_invoice.taxable_supply_date, "due_date"=>outgoing_invoice.due_date, "total_computed_base"=>outgoing_invoice.total_computed_base, "total_computed_vat"=>outgoing_invoice.total_computed_vat, "total_corrected_base"=>outgoing_invoice.total_corrected_base, "total_corrected_vat"=>outgoing_invoice.total_corrected_vat, "reverse_charge"=>outgoing_invoice.reverse_charge, "paid"=>outgoing_invoice.paid, "note"=>outgoing_invoice.note, "outgoing_invoice_sequence_id"=>outgoing_invoice.outgoing_invoice_sequence_id, "trade_subject_id"=>outgoing_invoice.trade_subject_id, "currency_id"=>outgoing_invoice.currency_id, "exchange_rate_id"=>outgoing_invoice.exchange_rate_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, id: outgoing_invoice.id
      expect(response).to have_http_status(:found)
    end
  end

end