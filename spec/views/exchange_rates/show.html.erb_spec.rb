require 'rails_helper'

RSpec.describe "exchange_rates/show.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:exchange_rate) {FactoryGirl.create(:exchange_rate)}

  before do
    sign_in user
  end

  it "shows Exchange rate with id: as parameter" do

    controller.extra_params = { :id=>exchange_rate.id }
    expect(controller.request.fullpath).to eq exchange_rate_path(exchange_rate)
  end  
end
