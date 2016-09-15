require 'rails_helper'

RSpec.describe "streets/edit.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:street) {FactoryGirl.create(:street)}

  before do
    sign_in user
  end

  it "edits Street with id: as parameter" do

    controller.extra_params = { :id => street.id }
    expect(controller.request.fullpath).to eq edit_street_path(street)
  end  
end
