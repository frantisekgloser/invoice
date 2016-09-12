require 'rails_helper'

RSpec.describe "vat_charges/show.html.erb", type: :view do

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    
    if User.where(:email ==  "test@test.com") == []
      @user = User.create!(email: 'test@test.com', password: '12test34', trade_subject: 'test', identification_number: '123', house_number: 1, city: 'test_city', postal_code: '123', country: 'test_country')
    else
      @user = User.where(:email ==  "test@test.com")
    end

    sign_in @user
    @country = Country.create!(name: 'test_country_name', user_id: @user.id)
    @vat_charge = VatCharge.create!(percentage: '123', country_id: @country.id, user_id: @user.id)
  end

  it "shows VAT charge with id: as parameter" do

    controller.extra_params = { :id => @vat_charge.id }
    expect(controller.request.fullpath).to eq vat_charge_path(@vat_charge)
  end  
end
