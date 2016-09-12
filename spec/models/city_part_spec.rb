require 'rails_helper'

RSpec.describe CityPart, :type => :model do
  subject { CityPart.new }
  
  describe "Associations" do
    it { should belong_to(:city) }
    it { should belong_to(:user) }

    it { should have_many(:streets) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }  
    it { should validate_presence_of(:postal_code) }
    it { should validate_presence_of(:city_id) }
    it { should validate_presence_of(:user_id) }  
  end

end
