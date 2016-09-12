require 'rails_helper'

RSpec.describe IncomeReportsController, type: :controller do

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    
    if User.where(:email ==  "test@test.com") == []
      @user = User.create!(email: 'test@test.com', password: '12test34', trade_subject: 'test', identification_number: '123', house_number: 1, city: 'test_city', postal_code: '123', country: 'test_country')
    else
      @user = User.where(:email ==  "test@test.com")
    end

    sign_in @user
    @income_report = IncomeReport.create!(number: '123', date: '2016-02-03', to_pay: '123', to_receive: '321', note: 'test_income_report_note', user_id: @user.id)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: @income_report.id
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
      get :edit, id: @income_report.id
      expect(response).to have_http_status(:success)
    end
  end

    describe "POST #create" do
    it "returns http success" do
      post :create, income_report: { "number"=>@income_report.number, "date"=>@income_report.date, "to_pay"=>@income_report.to_pay, "to_receive"=>@income_report.to_receive, "note"=>@income_report.note }
      expect(response).to have_http_status(:found)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      put :update, id: @income_report.id, income_report: { "number"=>@income_report.number, "date"=>@income_report.date, "to_pay"=>@income_report.to_pay, "to_receive"=>@income_report.to_receive, "note"=>@income_report.note }
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, id: @income_report.id
      expect(response).to have_http_status(:found)
    end
  end

end