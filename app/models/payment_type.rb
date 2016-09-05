class PaymentType < ActiveRecord::Base

  belongs_to :user

  has_many :payments, :dependent => :destroy

  validates_presence_of :name, :user_id

end
