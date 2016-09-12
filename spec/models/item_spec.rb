require 'rails_helper'

RSpec.describe Item, :type => :model do
  subject { Item.new }
  
  describe "Associations" do
    it { should belong_to(:currency) }
    it { should belong_to(:vat_charge) }
    it { should belong_to(:trade_subject) }
    it { should belong_to(:user) }

    it { should have_many(:incomming_invoice_items) }
    it { should have_many(:outgoing_invoice_items) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) } 
    it { should validate_presence_of(:unit_price) } 
    it { should validate_presence_of(:currency_id) }
    it { should validate_presence_of(:vat_charge_id) }
    it { should validate_presence_of(:trade_subject_id) }
    it { should validate_presence_of(:user_id) }  
  end

end
