class Province < ActiveRecord::Base
  belongs_to :country
  belongs_to :user

  has_many :cities

end
