require 'rails_helper'

RSpec.describe IncomeReportsController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}
  let(:income_report) {FactoryGirl.create(:income_report)}

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
      get :show, id: income_report.id
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
      get :edit, id: income_report.id
      expect(response).to have_http_status(:success)
    end
  end

    describe "POST #create" do
    it "returns http success" do
      post :create, income_report: { "number"=>income_report.number, "date"=>income_report.date, "to_pay"=>income_report.to_pay, "to_receive"=>income_report.to_receive, "note"=>income_report.note }
      expect(response).to have_http_status(:found)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      put :update, id: income_report.id, income_report: { "number"=>income_report.number, "date"=>income_report.date, "to_pay"=>income_report.to_pay, "to_receive"=>income_report.to_receive, "note"=>income_report.note }
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, id: income_report.id
      expect(response).to have_http_status(:found)
    end
  end

end