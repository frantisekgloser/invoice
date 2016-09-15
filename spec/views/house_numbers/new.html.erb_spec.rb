require 'rails_helper'

RSpec.describe "house_numbers/new.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "builds new House number" do

    expect(controller.request.fullpath).to eq new_house_number_path
  end  
end
