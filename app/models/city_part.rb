class CityPart < ActiveRecord::Base
  belongs_to :city
  belongs_to :user

  has_many :streets, :dependent => :destroy 

end
