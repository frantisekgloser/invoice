class CityPart < ActiveRecord::Base

  belongs_to :city
  belongs_to :user

  has_many :streets, :dependent => :destroy 

  validates_presence_of :name, :postal_code, :city_id, :user_id

end
