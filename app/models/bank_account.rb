class BankAccount < ActiveRecord::Base
  belongs_to :bank
  belongs_to :currency
  belongs_to :user

  attr_accessible :name, :number, :iban  
end
