require 'rails_helper'

RSpec.describe "tasks/edit.html.erb", type: :view do

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
  end

  it "edits Task with id: as parameter" do

    controller.extra_params = { :id => @task.id }
    expect(controller.request.fullpath).to eq edit_task_path(@task)
  end  
end
