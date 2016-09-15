require 'rails_helper'

RSpec.describe "cities/edit.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:city) {FactoryGirl.create(:city)}

  before do
    sign_in user
  end

  it "edits City with id: as parameter" do

    controller.extra_params = { :id=>city.id }
    expect(controller.request.fullpath).to eq edit_city_path(city)
  end  
end
