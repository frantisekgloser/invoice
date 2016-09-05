class DayEntry < ActiveRecord::Base

  belongs_to :task
  belongs_to :user

  validates_presence_of :date, :start, :stop, :invoiced, :task_id, :user_id

end