require 'rails_helper'

RSpec.describe "currencies/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "shows index of Currencies" do

    expect(controller.request.fullpath).to eq currencies_path
  end  
end
