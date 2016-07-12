class BankAccount < ActiveRecord::Base
  belongs_to :bank
  belongs_to :currency
  belongs_to :user

  has_many :payments, :dependent => :destroy

end
