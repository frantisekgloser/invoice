require 'rails_helper'

RSpec.describe AddressType, :type => :model do
  subject { AddressType.new }
  
  describe "Associations" do
    it { should belong_to(:user) }

    it { should have_many(:address_links) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }  
    it { should validate_presence_of(:user_id) }  
  end

end
