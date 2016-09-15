require 'rails_helper'

RSpec.describe "currencies/new.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "builds new Currency" do

    expect(controller.request.fullpath).to eq new_currency_path
  end  
end
