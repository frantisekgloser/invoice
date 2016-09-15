require 'rails_helper'

RSpec.describe ExchangeRatesController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}
  let(:exchange_rate) {FactoryGirl.create(:exchange_rate)}

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
      get :show, id: exchange_rate.id
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
      get :edit, id: exchange_rate.id
      expect(response).to have_http_status(:success)
    end
  end

    describe "POST #create" do
    it "returns http success" do
      post :create, exchange_rate: { "rate"=>exchange_rate.rate, "date"=>exchange_rate.date, "bank_id"=>exchange_rate.bank_id, "currency_id"=>exchange_rate.currency_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      put :update, id: exchange_rate.id, exchange_rate: { "rate"=>exchange_rate.rate, "date"=>exchange_rate.date, "bank_id"=>exchange_rate.bank_id, "currency_id"=>exchange_rate.currency_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, id: exchange_rate.id
      expect(response).to have_http_status(:found)
    end
  end

end