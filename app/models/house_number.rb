class HouseNumber < ActiveRecord::Base
  belongs_to :city
  belongs_to :street
  belongs_to :user

  has_many :address_links, :dependent => :destroy

end
