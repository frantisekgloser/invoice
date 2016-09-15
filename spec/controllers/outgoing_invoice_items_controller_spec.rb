require 'rails_helper'

RSpec.describe OutgoingInvoiceItemsController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}
  let(:outgoing_invoice) {FactoryGirl.create(:outgoing_invoice)}
  let(:outgoing_invoice_item) {FactoryGirl.create(:outgoing_invoice_item)}

  before do
    sign_in user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index, outgoing_invoice_id: outgoing_invoice.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, outgoing_invoice_id: outgoing_invoice.id, id: outgoing_invoice_item.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, outgoing_invoice_id: outgoing_invoice.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, outgoing_invoice_id: outgoing_invoice.id, id: outgoing_invoice_item.id
      expect(response).to have_http_status(:success)
    end
  end

    describe "POST #create" do
    it "returns http success" do
      post :create, outgoing_invoice_id: outgoing_invoice.id, outgoing_invoice_item: { "amount"=>outgoing_invoice_item.amount, "note"=>outgoing_invoice_item.note, "outgoing_invoice_id"=>outgoing_invoice_item.outgoing_invoice_id, "item_id"=>outgoing_invoice_item.item_id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      put :update, outgoing_invoice_id: outgoing_invoice.id, id: outgoing_invoice_item.id, outgoing_invoice_item: { "amount"=>outgoing_invoice_item.amount, "note"=>outgoing_invoice_item.note, "outgoing_invoice_id"=>outgoing_invoice_item.outgoing_invoice_id, "item_id"=>outgoing_invoice_item.item_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, outgoing_invoice_id: outgoing_invoice.id, id: outgoing_invoice_item.id
      expect(response).to have_http_status(:found)
    end
  end

end