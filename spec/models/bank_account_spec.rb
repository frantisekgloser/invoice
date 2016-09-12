require 'rails_helper'

RSpec.describe BankAccount, :type => :model do
  subject { BankAccount.new }
  
  describe "Associations" do
    it { should belong_to(:bank) }
    it { should belong_to(:currency) }
    it { should belong_to(:user) }
  
    it { should have_many(:payments) }
  end

  describe "Validations" do
    it { should validate_presence_of(:number) }  
    it { should validate_presence_of(:bank_id) }
    it { should validate_presence_of(:currency_id) }  
    it { should validate_presence_of(:user_id) }  
  end

end
