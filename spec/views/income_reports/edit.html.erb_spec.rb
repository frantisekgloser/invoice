require 'rails_helper'

RSpec.describe "income_reports/edit.html.erb", type: :view do

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

  it "edits Income report with id: as parameter" do

    controller.extra_params = { :id=>@income_report.id }
    expect(controller.request.fullpath).to eq edit_income_report_path(@income_report)
  end  
end
