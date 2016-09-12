require 'rails_helper'

RSpec.describe Task, :type => :model do
  subject { Task.new }
  
  describe "Associations" do
    it { should belong_to(:project) }
    it { should belong_to(:user) }

    it { should have_many(:day_entries) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:project_id) } 
    it { should validate_presence_of(:user_id) }  
  end

end
