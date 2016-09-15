require 'rails_helper'

RSpec.describe "tasks/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "shows index of Tasks" do

    expect(controller.request.fullpath).to eq tasks_path
  end  
end
