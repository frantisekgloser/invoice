require 'rails_helper'

RSpec.describe BanksController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}
  let(:bank) {FactoryGirl.create(:bank)}

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
      get :show, id: bank.id
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
      get :edit, id: bank.id
      expect(response).to have_http_status(:success)
    end
  end

    describe "POST #create" do
    it "returns http success" do
      post :create, bank: { "name"=>bank.name, "code"=>bank.code }
      expect(response).to have_http_status(:found)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      put :update, id: bank.id, bank: { "name"=>bank.name, "code"=>bank.code }
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, id: bank.id
      expect(response).to have_http_status(:found)
    end
  end

end