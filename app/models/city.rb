class City < ActiveRecord::Base
  belongs_to :country
  belongs_to :province
  belongs_to :user

  has_many :city_parts, :dependent => :destroy  
  has_many :streets, :dependent => :destroy 

  attr_accessible :name, :postal_code

end
