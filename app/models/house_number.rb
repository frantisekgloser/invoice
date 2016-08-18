class HouseNumber < ActiveRecord::Base
  belongs_to :city
  belongs_to :street
  belongs_to :user

  has_many :address_links, :dependent => :destroy

  
  def address_complete
    if street_id then "#{street.name} #{house_number}, #{city.name}" 
    		     else "#{city.name} #{house_number}" end

  end
  
end
