class City < ActiveRecord::Base
  belongs_to :country
  belongs_to :province
  belongs_to :user

  has_many :city_parts, :dependent => :destroy  
  has_many :streets, :dependent => :destroy 
  has_many :house_numbers, :dependent => :destroy

end
