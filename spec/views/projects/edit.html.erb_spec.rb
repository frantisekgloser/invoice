require 'rails_helper'

RSpec.describe "projects/edit.html.erb", type: :view do

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
  end

  it "edits Project with id: as parameter" do

    controller.extra_params = { :id => @project.id }
    expect(controller.request.fullpath).to eq edit_project_path(@project)
  end  
end
