require 'rails_helper'

RSpec.describe "projects/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "shows index of Projects" do

    expect(controller.request.fullpath).to eq projects_path
  end  
end
