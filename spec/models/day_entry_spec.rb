require 'rails_helper'

RSpec.describe DayEntry, :type => :model do
  subject { DayEntry.new }
  
  describe "Associations" do
    it { should belong_to(:task) }
    it { should belong_to(:user) }
  end

  describe "Validations" do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:start) }
    it { should validate_presence_of(:stop) }
    it { should validate_presence_of(:invoiced) }
    it { should validate_presence_of(:task_id) }  
    it { should validate_presence_of(:user_id) }  
  end

end
