class Project < ActiveRecord::Base

  belongs_to :trade_subject
  belongs_to :user

  has_many :tasks, :dependent => :destroy

  validates_presence_of :name, :trade_subject_id, :user_id

end
