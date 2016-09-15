require 'rails_helper'

RSpec.describe "cities/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "shows index of Cities" do

    expect(controller.request.fullpath).to eq cities_path
  end  
end
