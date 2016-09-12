require 'rails_helper'

RSpec.describe VatReportsController, type: :controller do

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    
    if User.where(:email ==  "test@test.com") == []
      @user = User.create!(email: 'test@test.com', password: '12test34', trade_subject: 'test', identification_number: '123', house_number: 1, city: 'test_city', postal_code: '123', country: 'test_country')
    else
      @user = User.where(:email ==  "test@test.com")
    end

    sign_in @user
    @vat_report = VatReport.create!(number: '123', date: '2016-08-09', to_pay: '123', to_receive: '321', note: 'test_vat_report_note', user_id: @user.id)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: @vat_report.id
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
      get :edit, id: @vat_report.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, vat_report: { "number"=>@vat_report.number, "date"=>@vat_report.date, "to_pay"=>@vat_report.to_pay, "to_receive"=>@vat_report.to_receive, "note"=>@vat_report.note }
      expect(response).to have_http_status(:found)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      put :update, id: @vat_report.id, vat_report: { "number"=>@vat_report.number, "date"=>@vat_report.date, "to_pay"=>@vat_report.to_pay, "to_receive"=>@vat_report.to_receive, "note"=>@vat_report.note }
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, id: @vat_report.id
      expect(response).to have_http_status(:found)
    end
  end

end