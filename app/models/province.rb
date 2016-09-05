class Province < ActiveRecord::Base

  belongs_to :country
  belongs_to :user

  has_many :cities

  validates_presence_of :name, :country_id, :user_id

end
