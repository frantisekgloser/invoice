require 'rails_helper'

RSpec.describe IncommingInvoice, :type => :model do
  subject { IncommingInvoice.new }
  
  describe "Associations" do
    it { should belong_to(:incomming_invoice_sequence) }
    it { should belong_to(:trade_subject) }
    it { should belong_to(:currency) }
    it { should belong_to(:exchange_rate) }
    it { should belong_to(:user) }

    it { should have_many(:incomming_invoice_items) }
    it { should have_many(:incomming_invoice_payments) }
  end

  describe "Validations" do
    it { should validate_presence_of(:number) } 
    it { should validate_presence_of(:generated_on_date) } 
    it { should validate_presence_of(:taxable_supply_date) } 
    it { should validate_presence_of(:due_date) } 
    it { should validate_presence_of(:reverse_charge) } 
    it { should validate_presence_of(:paid) } 
    it { should validate_presence_of(:incomming_invoice_sequence_id) } 
    it { should validate_presence_of(:trade_subject_id) } 
    it { should validate_presence_of(:currency_id) }      
    it { should validate_presence_of(:exchange_rate_id) }  
    it { should validate_presence_of(:user_id) }  
  end

end
