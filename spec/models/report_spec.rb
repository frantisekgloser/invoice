require 'rails_helper'

RSpec.describe Report, :type => :model do
  subject { Report.new }
  
  describe "Associations" do
    it { should belong_to(:report_type) }
    it { should belong_to(:user) }
  end

  describe "Validations" do
    it { should validate_presence_of(:date) } 
    it { should validate_presence_of(:report_type_id) }
    it { should validate_presence_of(:user_id) }  
  end

end
