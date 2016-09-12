require 'rails_helper'

RSpec.describe ExchangeRate, :type => :model do
  subject { ExchangeRate.new }
  
  describe "Associations" do
    it { should belong_to(:bank) }
    it { should belong_to(:currency) }
    it { should belong_to(:user) }

    it { should have_many(:incomming_invoices) }
    it { should have_many(:outgoing_invoices) }
    it { should have_many(:incomming_invoice_payments) }
    it { should have_many(:outgoing_invoice_payments) }
  end

  describe "Validations" do
    it { should validate_presence_of(:rate) }  
    it { should validate_presence_of(:date) }  
    it { should validate_presence_of(:bank_id) }  
    it { should validate_presence_of(:currency_id) }  
    it { should validate_presence_of(:user_id) }  
  end

end
