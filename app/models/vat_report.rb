class VatReport < ActiveRecord::Base

  belongs_to :user

  has_many :payments, :dependent => :destroy

  validates_presence_of :number, :date, :user_id

end
