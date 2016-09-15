require 'rails_helper'

RSpec.describe "provinces/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "shows index of Provinces" do

    expect(controller.request.fullpath).to eq provinces_path
  end  
end
