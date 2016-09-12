class OutgoingInvoicePayment < ActiveRecord::Base

  belongs_to :payment
  belongs_to :outgoing_invoice
  belongs_to :exchange_rate
  belongs_to :user

  validates_presence_of  :amount, :payment_id, :outgoing_invoice_id, :exchange_rate_id, :user_id

end
