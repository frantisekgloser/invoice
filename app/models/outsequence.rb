class Outsequence < ActiveRecord::Base
  belongs_to :user

  has_many :outinvoices, :dependent => :destroy 

end
