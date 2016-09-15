require 'rails_helper'

RSpec.describe "currencies/show.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:currency) {FactoryGirl.create(:currency)}

  before do
    sign_in user
  end

  it "shows Currency with id: as parameter" do

    controller.extra_params = { :id=>currency.id }
    expect(controller.request.fullpath).to eq currency_path(currency)
  end  
end
