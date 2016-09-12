require 'rails_helper'

RSpec.describe Street, :type => :model do
  subject { Street.new }
  
  describe "Associations" do
    it { should belong_to(:city) }
    it { should belong_to(:city_part) }
    it { should belong_to(:user) }

    it { should have_many(:house_numbers) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:city_id) } 
    it { should validate_presence_of(:user_id) }  
  end

end
