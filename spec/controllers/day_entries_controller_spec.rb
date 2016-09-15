require 'rails_helper'

RSpec.describe DayEntriesController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}
  let(:day_entry) {FactoryGirl.create(:day_entry)}

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
      get :show, id: day_entry.id
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
      get :edit, id: day_entry.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, day_entry: { "date"=>day_entry.date, "start"=>day_entry.start, "stop"=>day_entry.stop, "invoiced"=>day_entry.invoiced, "task_id"=>day_entry.task_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      put :update, id: day_entry.id, day_entry: { "date"=>day_entry.date, "start"=>day_entry.start, "stop"=>day_entry.stop, "invoiced"=>day_entry.invoiced, "task_id"=>day_entry.task_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, id: day_entry.id
      expect(response).to have_http_status(:found)
    end
  end

end