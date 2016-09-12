require 'rails_helper'

RSpec.describe "currencies/edit.html.erb", type: :view do

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    
    if User.where(:email ==  "test@test.com") == []
      @user = User.create!(email: 'test@test.com', password: '12test34', trade_subject: 'test', identification_number: '123', house_number: 1, city: 'test_city', postal_code: '123', country: 'test_country')
    else
      @user = User.where(:email ==  "test@test.com")
    end

    sign_in @user
    @currency = Currency.create!(name: 'test_currency', user_id: @user.id)
  end

  it "edits Currency with id: as parameter" do

    controller.extra_params = { :id=>@currency.id }
    expect(controller.request.fullpath).to eq edit_currency_path(@currency)
  end  
end
