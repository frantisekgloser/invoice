require 'rails_helper'

RSpec.describe "task_types/new.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "builds new Task type" do

    expect(controller.request.fullpath).to eq new_task_type_path
  end  
end
