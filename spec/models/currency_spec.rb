require 'rails_helper'

RSpec.describe Currency, :type => :model do
  subject { Currency.new }
  
  describe "Associations" do
    it { should belong_to(:user) }

    it { should have_many(:bank_accounts) }
    it { should have_many(:exchange_rates) }
    it { should have_many(:incomming_invoices) }
    it { should have_many(:items) }
    it { should have_many(:outgoing_invoices) }
    it { should have_many(:payments) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }  
    it { should validate_presence_of(:user_id) }  
  end

end
