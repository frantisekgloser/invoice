class Report < ActiveRecord::Base

  belongs_to :report_type
  belongs_to :user
  
  validates_presence_of :date, :report_type_id, :user_id

end
