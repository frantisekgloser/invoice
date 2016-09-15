require 'rails_helper'

RSpec.describe "income_reports/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "shows index of Income reports" do

    expect(controller.request.fullpath).to eq income_reports_path
  end  
end
