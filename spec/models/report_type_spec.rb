require 'rails_helper'

RSpec.describe ReportType, :type => :model do
  subject { ReportType.new }
  
  describe "Associations" do
    it { should belong_to(:user) }

    it { should have_many(:reports) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) } 
    it { should validate_presence_of(:user_id) }  
  end

end
