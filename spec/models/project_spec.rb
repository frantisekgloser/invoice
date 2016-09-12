require 'rails_helper'

RSpec.describe Project, :type => :model do
  subject { Project.new }
  
  describe "Associations" do
    it { should belong_to(:trade_subject) }
    it { should belong_to(:user) }

    it { should have_many(:tasks) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) } 
    it { should validate_presence_of(:trade_subject_id) }
    it { should validate_presence_of(:user_id) }  
  end

end
