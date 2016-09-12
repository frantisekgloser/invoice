require 'rails_helper'

RSpec.describe TaskType, :type => :model do
  subject { TaskType.new }
  
  describe "Associations" do
    it { should belong_to(:user) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:user_id) }  
  end

end
