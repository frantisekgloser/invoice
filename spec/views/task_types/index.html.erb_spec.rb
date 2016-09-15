require 'rails_helper'

RSpec.describe "task_types/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "shows index of Task types" do

    expect(controller.request.fullpath).to eq task_types_path
  end  
end
