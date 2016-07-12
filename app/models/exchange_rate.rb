class ExchangeRate < ActiveRecord::Base
  belongs_to :bank
  belongs_to :currency
  belongs_to :user

  has_many :ininvoices, :dependent => :destroy 
  has_many :outinvoices, :dependent => :destroy 
  has_many :ininvoice_payments, :dependent => :destroy
  has_many :outinvoice_payments, :dependent => :destroy

end
