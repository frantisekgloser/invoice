require 'rails_helper'

RSpec.describe "countries/new.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "builds new Country" do

    expect(controller.request.fullpath).to eq new_country_path
  end  
end
