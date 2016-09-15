require 'rails_helper'

RSpec.describe "cities/show.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:city) {FactoryGirl.create(:city)}

  before do
    sign_in user
  end

  it "shows City with id: as parameter" do

    controller.extra_params = { :id=>city.id }
    expect(controller.request.fullpath).to eq city_path(city)
  end  
end
