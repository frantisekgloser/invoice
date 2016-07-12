class Report < ActiveRecord::Base
  belongs_to :report_type
  belongs_to :user
  
end
