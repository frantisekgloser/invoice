class VatCharge < ActiveRecord::Base
  belongs_to :country
  belongs_to :user

  has_many :items, :dependent => :destroy
  
end
