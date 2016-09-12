require 'rails_helper'

RSpec.describe IncomeReport, :type => :model do
  subject { IncomeReport.new }
  
  describe "Associations" do
    it { should belong_to(:user) }

    it { should have_many(:payments) }
  end

  describe "Validations" do
    it { should validate_presence_of(:number) }  
    it { should validate_presence_of(:date) }  
    it { should validate_presence_of(:user_id) }  
  end

end
