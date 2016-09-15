require 'rails_helper'

RSpec.describe "income_reports/show.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:income_report) {FactoryGirl.create(:income_report)}

  before do
    sign_in user
  end

  it "shows Income report with id: as parameter" do

    controller.extra_params = { :id=>income_report.id }
    expect(controller.request.fullpath).to eq income_report_path(income_report)
  end  
end
