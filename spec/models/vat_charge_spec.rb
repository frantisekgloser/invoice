require 'rails_helper'

RSpec.describe VatCharge, :type => :model do
  subject { VatCharge.new }
  
  describe "Associations" do
    it { should belong_to(:country) }
    it { should belong_to(:user) }

    it { should have_many(:items) }
  end

  describe "Validations" do
    it { should validate_presence_of(:percentage) }
    it { should validate_presence_of(:country_id) }
    it { should validate_presence_of(:user_id) }  
  end

end
