class ReportType < ActiveRecord::Base
  belongs_to :user

  has_many :reports, :dependent => :destroy

  attr_accessible :name

end
