require 'rails_helper'

RSpec.describe AddressLink, :type => :model do
  subject { AddressLink.new }
  
  describe "Associations" do
    it { should belong_to(:address_type) }
    it { should belong_to(:house_number) }
    it { should belong_to(:user) }
  end

  describe "Validations" do
    it { should validate_presence_of(:address_type_id) }  
    it { should validate_presence_of(:house_number_id) }  
    it { should validate_presence_of(:user_id) }  
  end

end
