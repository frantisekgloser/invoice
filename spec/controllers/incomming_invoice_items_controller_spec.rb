require 'rails_helper'

RSpec.describe IncommingInvoiceItemsController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}
  let(:incomming_invoice) {FactoryGirl.create(:incomming_invoice)}
  let(:incomming_invoice_item) {FactoryGirl.create(:incomming_invoice_item)}

  before do
    sign_in user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index, incomming_invoice_id: incomming_invoice.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, incomming_invoice_id: incomming_invoice.id, id: incomming_invoice_item.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, incomming_invoice_id: incomming_invoice.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, incomming_invoice_id: incomming_invoice.id, id: incomming_invoice_item.id
      expect(response).to have_http_status(:success)
    end
  end

    describe "POST #create" do
    it "returns http success" do
      post :create, incomming_invoice_id: incomming_invoice.id, incomming_invoice_item: { "amount"=>incomming_invoice_item.amount, "note"=>incomming_invoice_item.note, "incomming_invoice_id"=>incomming_invoice_item.incomming_invoice_id, "item_id"=>incomming_invoice_item.item_id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      put :update, incomming_invoice_id: incomming_invoice.id, id: incomming_invoice_item.id, incomming_invoice_item: { "amount"=>incomming_invoice_item.amount, "note"=>incomming_invoice_item.note, "incomming_invoice_id"=>incomming_invoice_item.incomming_invoice_id, "item_id"=>incomming_invoice_item.item_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, incomming_invoice_id: incomming_invoice.id, id: incomming_invoice_item.id
      expect(response).to have_http_status(:found)
    end
  end

end