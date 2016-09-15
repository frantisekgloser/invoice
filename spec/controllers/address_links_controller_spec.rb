require 'rails_helper'

RSpec.describe AddressLinksController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}
  let(:address_link) {FactoryGirl.create(:address_link)}

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

      get :show, id: address_link.id
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
      get :edit, id: address_link.id
      expect(response).to have_http_status(:success)
    end
  end

    describe "POST #create" do
    it "returns http success" do
      post :create, address_link: { "address_type_id"=>address_link.address_type_id, "house_number_id"=>address_link.house_number_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      put :update, id: address_link.id, address_link: { "address_type_id"=>address_link.address_type_id, "house_number_id"=>address_link.house_number_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, id: address_link.id
      expect(response).to have_http_status(:found)
    end
  end

end