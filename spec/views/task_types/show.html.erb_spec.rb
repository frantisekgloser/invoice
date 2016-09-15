require 'rails_helper'

RSpec.describe "task_types/show.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:task_type) {FactoryGirl.create(:task_type)}

  before do
    sign_in user
  end

  it "shows Task type with id: as parameter" do

    controller.extra_params = { :id => task_type.id }
    expect(controller.request.fullpath).to eq task_type_path(task_type)
  end  
end
