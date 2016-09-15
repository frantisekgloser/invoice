require 'rails_helper'

RSpec.describe IncommingInvoiceSequencesController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}
  let(:incomming_invoice_sequence) {FactoryGirl.create(:incomming_invoice_sequence)}

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
      get :show, id: incomming_invoice_sequence.id
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
      get :edit, id: incomming_invoice_sequence.id
      expect(response).to have_http_status(:success)
    end
  end

    describe "POST #create" do
    it "returns http success" do
      post :create, incomming_invoice_sequence: { "name"=>incomming_invoice_sequence.name, "note"=>incomming_invoice_sequence.note }
      expect(response).to have_http_status(:found)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      put :update, id: incomming_invoice_sequence.id, incomming_invoice_sequence: { "name"=>incomming_invoice_sequence.name, "note"=>incomming_invoice_sequence.note }
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, id: incomming_invoice_sequence.id
      expect(response).to have_http_status(:found)
    end
  end

end