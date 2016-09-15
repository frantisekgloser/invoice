require 'rails_helper'

RSpec.describe "provinces/edit.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:province) {FactoryGirl.create(:province)}

  before do
    sign_in user
  end

  it "edits Province with id: as parameter" do

    controller.extra_params = { :id => province.id }
    expect(controller.request.fullpath).to eq edit_province_path(province)
  end  
end
