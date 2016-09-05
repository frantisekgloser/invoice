class VatCharge < ActiveRecord::Base

  belongs_to :country
  belongs_to :user

  has_many :items, :dependent => :destroy

  validates_presence_of :percentage, :country_id, :user_id

end
