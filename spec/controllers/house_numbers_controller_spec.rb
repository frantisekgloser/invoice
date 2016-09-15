require 'rails_helper'

RSpec.describe HouseNumbersController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}
  let(:house_number) {FactoryGirl.create(:house_number)}

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
      get :show, id: house_number.id
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
      get :edit, id: house_number.id
      expect(response).to have_http_status(:success)
    end
  end

    describe "POST #create" do
    it "returns http success" do
      post :create, house_number: { "house_number"=>house_number.house_number, "city_id"=>house_number.city_id, "street_id"=>house_number.street_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      put :update, id: house_number.id, house_number: { "house_number"=>house_number.house_number, "city_id"=>house_number.city_id, "street_id"=>house_number.street_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, id: house_number.id
      expect(response).to have_http_status(:found)
    end
  end

end