require 'rails_helper'

RSpec.describe Province, :type => :model do
  subject { Province.new }
  
  describe "Associations" do
    it { should belong_to(:country) }
    it { should belong_to(:user) }

    it { should have_many(:cities) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) } 
    it { should validate_presence_of(:country_id) }
    it { should validate_presence_of(:user_id) }  
  end

end
