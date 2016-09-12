class IncommingInvoiceItem < ActiveRecord::Base

  belongs_to :incomming_invoice
  belongs_to :item
  belongs_to :user

  validates_presence_of :amount, :incomming_invoice_id, :item_id, :user_id

end
