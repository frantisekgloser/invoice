require 'rails_helper'
require 'pry'

RSpec.describe HouseNumber, :type => :model do
  
  describe "Associations" do
    it { should belong_to(:city) }
    it { should belong_to(:street) }
    it { should belong_to(:user) }

    it { should have_many(:address_links) }
  end

  describe "Validations" do
    it { should validate_presence_of(:house_number) }  
    it { should validate_presence_of(:city_id) }  
    it { should validate_presence_of(:user_id) }  
  end
 
  describe 'city has no streets identification' do 
  before do

    if User.where(:email ==  "test@test.com") == []
        @user = User.create!(email: 'test@test.com', password: '12test34', trade_subject: 'test', identification_number: '123', house_number: 1, city: 'test_city', postal_code: '123', country: 'test_country')
      else
        @user = User..where(:email ==  "test@test.com")
      end

      @country = Country.create!(name: 'test_country', user_id: @user.id)
      @city = City.create!(name: 'test_city', postal_code: '123', country_id: @country.id, user_id: @user.id)
      @street = Street.create!(name: 'test_street', city_id: @city.id, user_id: @user.id)
      @house_number = HouseNumber.create!(house_number: 'test_house_number', city_id: @city.id, user_id: @user.id)
    
    end

 #     it expect(@house_number.address_complete).to eql(@city.name + " " + @house_number.house_number)
    end


    describe 'city has streets identification' do 
    
      before do
        @house_number..street_id = @street.id
      end

#      it expect(@house_number.address_complete).to eql(@street.name + " " + @house_number.house_number + ", " + @city.name)
    end
    
end
