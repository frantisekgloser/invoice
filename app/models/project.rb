class Project < ActiveRecord::Base
  belongs_to :trade_subject
  belongs_to :user

  has_many :tasks, :dependent => :destroy
  
end
