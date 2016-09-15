require 'rails_helper'

RSpec.describe "cities/new.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "builds new City" do

    expect(controller.request.fullpath).to eq new_city_path
  end  
end
