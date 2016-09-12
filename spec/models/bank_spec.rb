require 'rails_helper'

RSpec.describe Bank, :type => :model do
  subject { Bank.new }
  
  describe "Associations" do
    it { should belong_to(:user) }
 
    it { should have_many(:exchange_rates) }
    it { should have_many(:bank_accounts) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }  
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:user_id) }  
  end

end
