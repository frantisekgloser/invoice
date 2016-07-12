class AddressLink < ActiveRecord::Base
  belongs_to :address_type
  belongs_to :house_number
  belongs_to :user
end
