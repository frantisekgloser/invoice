class ReportType < ActiveRecord::Base

  belongs_to :user

  has_many :reports, :dependent => :destroy

  validates_presence_of :name, :user_id

end
