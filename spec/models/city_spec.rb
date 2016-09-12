require 'rails_helper'

RSpec.describe City, :type => :model do
  subject { City.new }
  
  describe "Associations" do
    it { should belong_to(:country) }
    it { should belong_to(:province) }
    it { should belong_to(:user) }

    it { should have_many(:city_parts) }
    it { should have_many(:streets) }
    it { should have_many(:house_numbers) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }  
    it { should validate_presence_of(:postal_code) }
    it { should validate_presence_of(:country_id) }
    it { should validate_presence_of(:user_id) }  
  end

end
