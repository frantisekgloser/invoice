require 'rails_helper'

RSpec.describe TradeSubjectsController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}
  let(:trade_subject) {FactoryGirl.create(:trade_subject)}

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
      get :show, id: trade_subject.id
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
      get :edit, id: trade_subject.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, trade_subject: { "name"=>trade_subject.name, "identification_number"=>trade_subject.identification_number, "vat"=>trade_subject.vat }
      expect(response).to have_http_status(:found)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      put :update, id: trade_subject.id, trade_subject: { "name"=>trade_subject.name, "identification_number"=>trade_subject.identification_number, "vat"=>trade_subject.vat }
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, id: trade_subject.id
      expect(response).to have_http_status(:found)
    end
  end

end