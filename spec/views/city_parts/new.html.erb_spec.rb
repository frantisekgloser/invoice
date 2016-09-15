require 'rails_helper'

RSpec.describe "city_parts/new.html.erb", type: :view do  
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "builds new City part" do

    expect(controller.request.fullpath).to eq new_city_part_path
  end  
end
