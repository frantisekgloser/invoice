class AddressLink < ActiveRecord::Base

  belongs_to :address_type
  belongs_to :house_number
  belongs_to :user

  validates_presence_of :address_type_id, :house_number_id, :user_id

end
