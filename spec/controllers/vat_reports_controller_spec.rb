require 'rails_helper'

RSpec.describe VatReportsController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}
  let(:vat_report) {FactoryGirl.create(:vat_report)}

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
      get :show, id: vat_report.id
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
      get :edit, id: vat_report.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, vat_report: { "number"=>vat_report.number, "date"=>vat_report.date, "to_pay"=>vat_report.to_pay, "to_receive"=>vat_report.to_receive, "note"=>vat_report.note }
      expect(response).to have_http_status(:found)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      put :update, id: vat_report.id, vat_report: { "number"=>vat_report.number, "date"=>vat_report.date, "to_pay"=>vat_report.to_pay, "to_receive"=>vat_report.to_receive, "note"=>vat_report.note }
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, id: vat_report.id
      expect(response).to have_http_status(:found)
    end
  end

end