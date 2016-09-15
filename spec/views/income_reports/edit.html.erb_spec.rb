require 'rails_helper'

RSpec.describe "income_reports/edit.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:income_report) {FactoryGirl.create(:income_report)}

  before do
    sign_in user
  end

  it "edits Income report with id: as parameter" do

    controller.extra_params = { :id=>income_report.id }
    expect(controller.request.fullpath).to eq edit_income_report_path(income_report)
  end  
end
