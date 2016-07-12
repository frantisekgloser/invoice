class PaymentType < ActiveRecord::Base
  belongs_to :user

  has_many :payments, :dependent => :destroy

end
