class HouseNumber < ActiveRecord::Base

  belongs_to :city
  belongs_to :street
  belongs_to :user

  has_many :address_links, :dependent => :destroy

  validates_presence_of :house_number, :city_id, :user_id  

end
