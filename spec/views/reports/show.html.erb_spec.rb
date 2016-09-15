require 'rails_helper'

RSpec.describe "reports/show.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:report) {FactoryGirl.create(:report)}

  before do
    sign_in user
  end

  it "shows Report with id: as parameter" do

    controller.extra_params = { :id => report.id }
    expect(controller.request.fullpath).to eq report_path(report)
  end  
end
