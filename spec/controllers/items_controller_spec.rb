require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    
    if User.where(:email ==  "test@test.com") == []
      @user = User.create!(email: 'test@test.com', password: '12test34', trade_subject: 'test', identification_number: '123', house_number: 1, city: 'test_city', postal_code: '123', country: 'test_country')
    else
      @user = User.where(:email ==  "test@test.com")
    end

    sign_in @user
    @currency = Currency.create!(name: 'test_currency', user_id: @user.id)
    @trade_subject = TradeSubject.create!(name: 'test_trade_subject_name', identification_number: '123', vat: 'test_trade_subject_vat', user_id: @user.id)
    @country = Country.create!(name: 'test_country_name', user_id: @user.id)
    @vat_charge = VatCharge.create!(percentage: '123', country_id: @country.id, user_id: @user.id)
    @item = Item.create!(name: 'test_item_name', note: 'test_item_note', unit_price: '123', currency_id: @currency.id, vat_charge_id: @vat_charge.id, trade_subject_id: @trade_subject.id, user_id: @user.id)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: @item.id
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
      get :edit, id: @item.id
      expect(response).to have_http_status(:success)
    end
  end

    describe "POST #create" do
    it "returns http success" do
      post :create, item: { "name"=>@item.name, "note"=>@item.note, "unit_price"=>@item.unit_price, "currency_id"=>@item.currency_id, "vat_charge_id"=>@item.vat_charge_id, "trade_subject_id"=>@item.trade_subject_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      put :update, id: @item.id, item: { "name"=>@item.name, "note"=>@item.note, "unit_price"=>@item.unit_price, "currency_id"=>@item.currency_id, "vat_charge_id"=>@item.vat_charge_id, "trade_subject_id"=>@item.trade_subject_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, id: @item.id
      expect(response).to have_http_status(:found)
    end
  end

end