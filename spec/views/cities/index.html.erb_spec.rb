require 'rails_helper'

RSpec.describe "cities/index.html.erb", type: :view do

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    
    if User.where(:email ==  "test@test.com") == []
      @user = User.create!(email: 'test@test.com', password: '12test34', trade_subject: 'test', identification_number: '123', house_number: 1, city: 'test_city', postal_code: '123', country: 'test_country')
    else
      @user = User.where(:email ==  "test@test.com")
    end

    sign_in @user
    @country = Country.create!(name: 'test_country', user_id: @user.id)
    @city = City.create!(name: 'test_city', postal_code: '123', country_id: @country.id, user_id: @user.id)
  end

  it "shows index of Cities" do

    expect(controller.request.fullpath).to eq cities_path
  end  
end
