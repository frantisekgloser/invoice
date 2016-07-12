class AddressType < ActiveRecord::Base
  belongs_to :user

  has_many :address_links, :dependent => :destroy

end
