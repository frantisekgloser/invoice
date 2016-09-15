require 'rails_helper'

RSpec.describe BankAccountsController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}
  let(:bank_account) {FactoryGirl.create(:bank_account)}

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
      get :show, id: bank_account.id
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
      get :edit, id: bank_account.id
      expect(response).to have_http_status(:success)
    end
  end

    describe "POST #create" do
    it "returns http success" do
      post :create, bank_account: { "name"=>bank_account.name, "number"=>bank_account.number, "iban"=>bank_account.iban, "bank_id"=>bank_account.bank_id, "currency_id"=>bank_account.currency_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      put :update, id: bank_account.id, bank_account: { "name"=>bank_account.name, "number"=>bank_account.number, "iban"=>bank_account.iban, "bank_id"=>bank_account.bank_id, "currency_id"=>bank_account.currency_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, id: bank_account.id
      expect(response).to have_http_status(:found)
    end
  end

end