require 'rails_helper'

RSpec.describe "countries/edit.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:country) {FactoryGirl.create(:country)}

  before do
    sign_in user
  end

  it "edits Country with id: as parameter" do

    controller.extra_params = { :id=>country.id }
    expect(controller.request.fullpath).to eq edit_country_path(country)
  end  
end
