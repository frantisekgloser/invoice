require 'rails_helper'

RSpec.describe "report_types/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "shows index of Report types" do

    expect(controller.request.fullpath).to eq report_types_path
  end  
end
