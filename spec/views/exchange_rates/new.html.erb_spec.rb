require 'rails_helper'

RSpec.describe "exchange_rates/new.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "builds new Exchange rate" do

    expect(controller.request.fullpath).to eq new_exchange_rate_path
  end  
end
