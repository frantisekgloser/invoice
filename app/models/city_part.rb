class CityPart < ActiveRecord::Base
  belongs_to :city
  belongs_to :user

  has_many :streets, :dependent => :destroy 

  attr_accessible :name, :postal_code

end
