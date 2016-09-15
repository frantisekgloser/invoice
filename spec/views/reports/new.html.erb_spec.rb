require 'rails_helper'

RSpec.describe "reports/new.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "builds new Report" do

    expect(controller.request.fullpath).to eq new_report_path
  end  
end
