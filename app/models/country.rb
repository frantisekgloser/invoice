class Country < ActiveRecord::Base
  belongs_to :user

  has_many :provinces, :dependent => :destroy  
  has_many :cities, :dependent => :destroy

  attr_accessible :name 

end
