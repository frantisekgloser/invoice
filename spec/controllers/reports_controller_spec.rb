require 'rails_helper'

RSpec.describe ReportsController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}
  let(:report) {FactoryGirl.create(:report)}

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
      get :show, id: report.id
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
      get :edit, id: report.id
      expect(response).to have_http_status(:success)
    end
  end

    describe "POST #create" do
    it "returns http success" do
      post :create, report: { "date"=>report.date, "to_pay"=>report.to_pay, "to_receive"=>report.to_receive, "report_type_id"=>report.report_type_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      put :update, id: report.id, report: { "date"=>report.date, "to_pay"=>report.to_pay, "to_receive"=>report.to_receive, "report_type_id"=>report.report_type_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, id: report.id
      expect(response).to have_http_status(:found)
    end
  end

end