require 'rails_helper'

RSpec.describe "provinces/show.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:province) {FactoryGirl.create(:province)}

  before do
    sign_in user
  end

  it "shows Province with id: as parameter" do

    controller.extra_params = { :id => province.id }
    expect(controller.request.fullpath).to eq province_path(province)
  end  
end
