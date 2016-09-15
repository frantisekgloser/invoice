require 'rails_helper'

RSpec.describe CityPartsController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}
  let(:city_part) {FactoryGirl.create(:city_part)}

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
      get :show, id: city_part.id
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
      get :edit, id: city_part.id
      expect(response).to have_http_status(:success)
    end
  end

    describe "POST #create" do
    it "returns http success" do
      post :create, city_part: { "name"=>city_part.name, "postal_code"=>city_part.postal_code, "city_id"=>city_part.city_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      put :update, id: city_part.id, city_part: { "name"=>city_part.name, "postal_code"=>city_part.postal_code, "city_id"=>city_part.city_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, id: city_part.id
      expect(response).to have_http_status(:found)
    end
  end

end