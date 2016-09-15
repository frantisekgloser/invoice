require 'rails_helper'

RSpec.describe "streets/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "shows index of Streets" do

    expect(controller.request.fullpath).to eq streets_path
  end  
end
