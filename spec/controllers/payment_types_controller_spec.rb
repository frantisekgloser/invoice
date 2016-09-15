require 'rails_helper'

RSpec.describe PaymentTypesController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}
  let(:payment_type) {FactoryGirl.create(:payment_type)}

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
      get :show, id: payment_type.id
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
      get :edit, id: payment_type.id
      expect(response).to have_http_status(:success)
    end
  end

    describe "POST #create" do
    it "returns http success" do
      post :create, payment_type: { "name"=>payment_type.name }
      expect(response).to have_http_status(:found)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      put :update, id: payment_type.id, payment_type: { "name"=>payment_type.name }
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, id: payment_type.id
      expect(response).to have_http_status(:found)
    end
  end

end