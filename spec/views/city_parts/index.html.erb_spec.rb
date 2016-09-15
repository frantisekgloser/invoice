require 'rails_helper'

RSpec.describe "city_parts/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "shows index of City parts" do

    expect(controller.request.fullpath).to eq city_parts_path
  end  
end
