require 'rails_helper'

RSpec.describe "city_parts/show.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:city_part) {FactoryGirl.create(:city_part)}

  before do
    sign_in user
  end

  it "shows City part with id: as parameter" do

    controller.extra_params = { :id=>city_part.id }
    expect(controller.request.fullpath).to eq city_part_path(city_part)
  end  
end
