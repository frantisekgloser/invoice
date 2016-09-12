require 'rails_helper'

RSpec.describe Country, :type => :model do
  subject { Country.new }
  
  describe "Associations" do
    it { should belong_to(:user) }

    it { should have_many(:cities) }
    it { should have_many(:provinces) }
    it { should have_many(:vat_charges) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }  
    it { should validate_presence_of(:user_id) }  
  end

end
