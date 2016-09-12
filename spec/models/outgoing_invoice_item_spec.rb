require 'rails_helper'

RSpec.describe OutgoingInvoiceItem, :type => :model do
  subject { OutgoingInvoiceItem.new }
  
  describe "Associations" do
    it { should belong_to(:outgoing_invoice) }
    it { should belong_to(:item) }
    it { should belong_to(:user) }
  end

  describe "Validations" do
    it { should validate_presence_of(:amount) } 
    it { should validate_presence_of(:outgoing_invoice_id) } 
    it { should validate_presence_of(:item_id) } 
    it { should validate_presence_of(:user_id) }  
  end

end
