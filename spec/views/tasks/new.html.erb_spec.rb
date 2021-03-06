require 'rails_helper'

RSpec.describe "tasks/new.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "builds new Task" do

    expect(controller.request.fullpath).to eq new_task_path
  end  
end
