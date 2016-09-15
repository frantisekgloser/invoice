require 'rails_helper'

RSpec.describe "tasks/edit.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:task) {FactoryGirl.create(:task)}

  before do
    sign_in user
  end

  it "edits Task with id: as parameter" do

    controller.extra_params = { :id => task.id }
    expect(controller.request.fullpath).to eq edit_task_path(task)
  end  
end
