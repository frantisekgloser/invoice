require 'rails_helper'

RSpec.describe OutgoingInvoicePayment, :type => :model do
  subject { OutgoingInvoicePayment.new }
  
  describe "Associations" do
    it { should belong_to(:payment) }
    it { should belong_to(:outgoing_invoice) }
    it { should belong_to(:exchange_rate) }
    it { should belong_to(:user) }
  end

  describe "Validations" do
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:payment_id) }
    it { should validate_presence_of(:outgoing_invoice_id) } 
    it { should validate_presence_of(:exchange_rate_id) } 
    it { should validate_presence_of(:user_id) }  
  end

end
