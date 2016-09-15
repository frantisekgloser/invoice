require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}
  let(:project) {FactoryGirl.create(:project)}

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
      get :show, id: project.id
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
      get :edit, id: project.id
      expect(response).to have_http_status(:success)
    end
  end

    describe "POST #create" do
    it "returns http success" do
      post :create, project: { "name"=>project.name, "note"=>project.note, "trade_subject_id"=>project.trade_subject_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      put :update, id: project.id, project: { "name"=>project.name, "note"=>project.note, "trade_subject_id"=>project.trade_subject_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, id: project.id
      expect(response).to have_http_status(:found)
    end
  end

end