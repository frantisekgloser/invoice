require 'rails_helper'

RSpec.describe TradeSubject, :type => :model do
  subject { TradeSubject.new }
  
  describe "Associations" do
    it { should belong_to(:user) }

    it { should have_many(:incomming_invoices) }
    it { should have_many(:items) }
    it { should have_many(:outgoing_invoices) }
    it { should have_many(:payments) }
    it { should have_many(:projects) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:identification_number) }
    it { should validate_presence_of(:user_id) }  
  end

end
