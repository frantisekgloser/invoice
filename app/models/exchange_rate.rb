class ExchangeRate < ActiveRecord::Base
  belongs_to :bank
  belongs_to :currency
  belongs_to :user

  has_many :incomming_invoices, :dependent => :destroy 
  has_many :outgoing_invoices, :dependent => :destroy 
  has_many :incomming_invoice_payments, :dependent => :destroy
  has_many :outgoing_invoice_payments, :dependent => :destroy

end
