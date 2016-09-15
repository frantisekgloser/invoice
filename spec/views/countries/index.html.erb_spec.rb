require 'rails_helper'

RSpec.describe "countries/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "shows index of Countries" do

    expect(controller.request.fullpath).to eq countries_path
  end  
end
