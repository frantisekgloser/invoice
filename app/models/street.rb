class Street < ActiveRecord::Base
  
  belongs_to :city
  belongs_to :city_part
  belongs_to :user

  has_many :house_numbers, :dependent => :destroy

  validates_presence_of :name, :city_id, :user_id

end
