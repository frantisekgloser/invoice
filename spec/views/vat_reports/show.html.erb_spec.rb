require 'rails_helper'

RSpec.describe "vat_reports/show.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:vat_report) {FactoryGirl.create(:vat_report)}

  before do
    sign_in user
  end

  it "shows VAT report with id: as parameter" do

    controller.extra_params = { :id => vat_report.id }
    expect(controller.request.fullpath).to eq vat_report_path(vat_report)
  end  
end