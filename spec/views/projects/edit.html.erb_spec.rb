require 'rails_helper'

RSpec.describe "projects/edit.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:project) {FactoryGirl.create(:project)}

  before do
    sign_in user
  end

  it "edits Project with id: as parameter" do

    controller.extra_params = { :id => project.id }
    expect(controller.request.fullpath).to eq edit_project_path(project)
  end  
end
