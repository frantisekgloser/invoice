require 'rails_helper'

RSpec.describe "address_types/show.html.erb", type: :view do

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    
    if User.where(:email ==  "test@test.com") == []
      @user = User.create!(email: 'test@test.com', password: '12test34', trade_subject: 'test', identification_number: '123', house_number: 1, city: 'test_city', postal_code: '123', country: 'test_country')
    else
      @user = User.where(:email ==  "test@test.com")
    end

    sign_in @user
    @address_type = AddressType.create!(name: 'test_address_type_name', user_id: @user.id)
  end

  it "shows Address type with id: as parameter" do

    controller.extra_params = { :id=>@address_type.id }
    expect(controller.request.fullpath).to eq address_type_path(@address_type)
  end  
end
