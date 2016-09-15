require 'rails_helper'

RSpec.describe "house_numbers/show.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:house_number) {FactoryGirl.create(:house_number)}

  before do
    sign_in user
  end

  it "shows House number with id: as parameter" do

    controller.extra_params = { :id=>house_number.id }
    expect(controller.request.fullpath).to eq house_number_path(house_number)
  end  
end
