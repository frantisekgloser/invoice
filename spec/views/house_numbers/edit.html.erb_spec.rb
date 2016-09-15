require 'rails_helper'

RSpec.describe "house_numbers/edit.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:house_number) {FactoryGirl.create(:house_number)}

  before do
    sign_in user
  end

  it "edits House number with id: as parameter" do

    controller.extra_params = { :id=>house_number.id }
    expect(controller.request.fullpath).to eq edit_house_number_path(house_number)
  end  
end
