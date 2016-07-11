class Street < ActiveRecord::Base
  belongs_to :city
  belongs_to :city_part
  belongs_to :user

  attr_accessible :name

end
