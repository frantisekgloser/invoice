require 'rails_helper'

RSpec.describe OutgoingInvoiceSequencesController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}
  let(:outgoing_invoice_sequence) {FactoryGirl.create(:outgoing_invoice_sequence)}

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
      get :show, id: outgoing_invoice_sequence.id
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
      get :edit, id: outgoing_invoice_sequence.id
      expect(response).to have_http_status(:success)
    end
  end

    describe "POST #create" do
    it "returns http success" do
      post :create, outgoing_invoice_sequence: { "name"=>outgoing_invoice_sequence.name, "note"=>outgoing_invoice_sequence.note }
      expect(response).to have_http_status(:found)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      put :update, id: outgoing_invoice_sequence.id, outgoing_invoice_sequence: { "name"=>outgoing_invoice_sequence.name, "note"=>outgoing_invoice_sequence.note }
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, id: outgoing_invoice_sequence.id
      expect(response).to have_http_status(:found)
    end
  end

end