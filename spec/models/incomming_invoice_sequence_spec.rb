require 'rails_helper'

RSpec.describe IncommingInvoiceSequence, :type => :model do
  subject { IncommingInvoiceSequence.new }
  
  describe "Associations" do
    it { should belong_to(:user) }

    it { should have_many(:incomming_invoices) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:user_id) }  
  end

end
