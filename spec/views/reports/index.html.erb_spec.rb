require 'rails_helper'

RSpec.describe "reports/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "shows index of Reports" do

    expect(controller.request.fullpath).to eq reports_path
  end  
end
