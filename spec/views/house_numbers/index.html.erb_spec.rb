require 'rails_helper'

RSpec.describe "house_numbers/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "shows index of House numbers" do

    expect(controller.request.fullpath).to eq house_numbers_path
  end  
end
