require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}
  let(:item) {FactoryGirl.create(:item)}

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
      get :show, id: item.id
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
      get :edit, id: item.id
      expect(response).to have_http_status(:success)
    end
  end

    describe "POST #create" do
    it "returns http success" do
      post :create, item: { "name"=>item.name, "note"=>item.note, "unit_price"=>item.unit_price, "currency_id"=>item.currency_id, "vat_charge_id"=>item.vat_charge_id, "trade_subject_id"=>item.trade_subject_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      put :update, id: item.id, item: { "name"=>item.name, "note"=>item.note, "unit_price"=>item.unit_price, "currency_id"=>item.currency_id, "vat_charge_id"=>item.vat_charge_id, "trade_subject_id"=>item.trade_subject_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, id: item.id
      expect(response).to have_http_status(:found)
    end
  end

end