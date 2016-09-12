require 'rails_helper'

RSpec.describe PaymentType, :type => :model do
  subject { PaymentType.new }
  
  describe "Associations" do
    it { should belong_to(:user) }

    it { should have_many(:payments) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) } 
    it { should validate_presence_of(:user_id) }  
  end

end
