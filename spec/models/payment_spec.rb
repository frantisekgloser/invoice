require 'rails_helper'

RSpec.describe Payment, :type => :model do
  subject { Payment.new }
  
  describe "Associations" do
    it { should belong_to(:payment_type) }
    it { should belong_to(:currency) }
    it { should belong_to(:bank_account) }
    it { should belong_to(:trade_subject) }
    it { should belong_to(:vat_report) }
    it { should belong_to(:income_report) }
    it { should belong_to(:user) }

    it { should have_many(:incomming_invoice_payments) }
    it { should have_many(:outgoing_invoice_payments) }
  end

  describe "Validations" do
    it { should validate_presence_of(:date) } 
    it { should validate_presence_of(:amount) } 
    it { should validate_presence_of(:payment_type_id) }
    it { should validate_presence_of(:currency_id) }
    it { should validate_presence_of(:bank_account_id) }
    it { should validate_presence_of(:trade_subject_id) }
    it { should validate_presence_of(:user_id) }  
  end

end
