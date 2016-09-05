class BankAccount < ActiveRecord::Base

  belongs_to :bank
  belongs_to :currency
  belongs_to :user

  has_many :payments, :dependent => :destroy

  validates_presence_of :number, :bank_id, :currency_id, :user_id

end
