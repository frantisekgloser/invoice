class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  has_many :day_entries, :dependent => :destroy

end