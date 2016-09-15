require 'rails_helper'

RSpec.describe "items/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "shows index of Items" do

    expect(controller.request.fullpath).to eq items_path
  end    
end
