require 'rails_helper'

RSpec.describe "countries/show.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:country) {FactoryGirl.create(:country)}

  before do
    sign_in user
  end

  it "shows Country with id: as parameter" do

    controller.extra_params = { :id=>country.id }
    expect(controller.request.fullpath).to eq country_path(country)
  end  
end
