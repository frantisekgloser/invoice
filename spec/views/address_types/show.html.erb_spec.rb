require 'rails_helper'

RSpec.describe "address_types/show.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:address_type) {FactoryGirl.create(:address_type)}

  before do
    sign_in user
  end

  it "shows Address type with id: as parameter" do

    controller.extra_params = { :id=>address_type.id }
    expect(controller.request.fullpath).to eq address_type_path(address_type)
  end  
end
