require 'rails_helper'

RSpec.describe "exchange_rates/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "shows index of Exchange rates" do

    expect(controller.request.fullpath).to eq exchange_rates_path
  end  
end
