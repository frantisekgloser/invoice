require 'rails_helper'

RSpec.describe "city_parts/edit.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:city_part) {FactoryGirl.create(:city_part)}

  before do
    sign_in user
  end

  it "edits City part with id: as parameter" do

    controller.extra_params = { :id=>city_part.id }
    expect(controller.request.fullpath).to eq edit_city_part_path(city_part)
  end  
end
