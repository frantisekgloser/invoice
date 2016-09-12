require 'rails_helper'

RSpec.describe DayEntriesController, type: :controller do

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    
    if User.where(:email ==  "test@test.com") == []
      @user = User.create!(email: 'test@test.com', password: '12test34', trade_subject: 'test', identification_number: '123', house_number: 1, city: 'test_city', postal_code: '123', country: 'test_country')
    else
      @user = User.where(:email ==  "test@test.com")
    end

    sign_in @user
    @trade_subject = TradeSubject.create!(name: 'test_trade_subject_name', identification_number: '123', vat: 'test_trade_subject_vat', user_id: @user.id)
    @project = Project.create!(name: 'test_project_name', note: 'test_project_note', trade_subject_id: @trade_subject.id, user_id: @user.id)
    @task = Task.create!(name: 'test_task_name', link: 'www.test_task_link.com', note: 'test_task_note', project_id: @project.id, user_id: @user.id)
    @day_entry = DayEntry.create!(date: '2016-01-02', start: '13:00', stop: '15:00', invoiced: true, task_id: @task.id, user_id: @user.id)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: @day_entry.id
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
      get :edit, id: @day_entry.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, day_entry: { "date"=>@day_entry.date, "start"=>@day_entry.start, "stop"=>@day_entry.stop, "invoiced"=>@day_entry.invoiced, "task_id"=>@day_entry.task_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      put :update, id: @day_entry.id, day_entry: { "date"=>@day_entry.date, "start"=>@day_entry.start, "stop"=>@day_entry.stop, "invoiced"=>@day_entry.invoiced, "task_id"=>@day_entry.task_id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, id: @day_entry.id
      expect(response).to have_http_status(:found)
    end
  end

end