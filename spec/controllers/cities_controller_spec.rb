require 'rails_helper'

RSpec.describe CitiesController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}
  let(:city) {FactoryGirl.create(:city)}

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
      get :show, id: city.id
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
      get :edit, id: city.id
      expect(response).to have_http_status(:success)
    end
  end

    describe "POST #create" do
    it "returns http success" do
      post :create, city: { "name"=>city.name, "postal_code"=>city.postal_code, "country_id"=>city.country_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      put :update, id: city.id, city: { "name"=>city.name, "postal_code"=>city.postal_code, "country_id"=>city.country_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, id: city.id
      expect(response).to have_http_status(:found)
    end
  end

end