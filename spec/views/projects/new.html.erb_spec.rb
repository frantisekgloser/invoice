require 'rails_helper'

RSpec.describe "projects/new.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "builds new Project" do

    expect(controller.request.fullpath).to eq new_project_path
  end  
end
