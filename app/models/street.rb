class Street < ActiveRecord::Base
  belongs_to :city
  belongs_to :city_part
  belongs_to :user

  has_many :house_numbers, :dependent => :destroy

end
