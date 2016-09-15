require 'rails_helper'

RSpec.describe "income_reports/new.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "builds new Income report" do

    expect(controller.request.fullpath).to eq new_income_report_path
  end  
end
