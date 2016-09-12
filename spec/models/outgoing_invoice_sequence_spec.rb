require 'rails_helper'

RSpec.describe OutgoingInvoiceSequence, :type => :model do
  subject { OutgoingInvoiceSequence.new }
  
  describe "Associations" do
    it { should belong_to(:user) }

    it { should have_many(:outgoing_invoices) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:user_id) }  
  end

end
