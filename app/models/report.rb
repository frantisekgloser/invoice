class Report < ActiveRecord::Base
  belongs_to :report_type
  belongs_to :user

  attr_accessible :date, :to_pay, :to_receive
  
end
