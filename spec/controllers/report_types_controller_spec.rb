require 'rails_helper'

RSpec.describe ReportTypesController, type: :controller do

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    
    if User.where(:email ==  "test@test.com") == []
      @user = User.create!(email: 'test@test.com', password: '12test34', trade_subject: 'test', identification_number: '123', house_number: 1, city: 'test_city', postal_code: '123', country: 'test_country')
    else
      @user = User.where(:email ==  "test@test.com")
    end

    sign_in @user
    @report_type = ReportType.create!(name: 'test_report_type_name', user_id: @user.id)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: @report_type.id
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
      get :edit, id: @report_type.id
      expect(response).to have_http_status(:success)
    end
  end

    describe "POST #create" do
    it "returns http success" do
      post :create, report_type: { "name"=>@report_type.name }
      expect(response).to have_http_status(:found)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      put :update, id: @report_type.id, report_type: { "name"=>@report_type.name }
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, id: @report_type.id
      expect(response).to have_http_status(:found)
    end
  end

end