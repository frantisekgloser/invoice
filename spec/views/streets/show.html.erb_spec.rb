require 'rails_helper'

RSpec.describe "streets/show.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:street) {FactoryGirl.create(:street)}

  before do
    sign_in user
  end

  it "shows Street with id: as parameter" do

    controller.extra_params = { :id => street.id }
    expect(controller.request.fullpath).to eq street_path(street)
  end  
end
