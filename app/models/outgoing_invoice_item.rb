class OutgoingInvoiceItem < ActiveRecord::Base

  belongs_to :outgoing_invoice
  belongs_to :item
  belongs_to :user

  validates_presence_of :amount, :outgoing_invoice_id, :item_id, :user_id

end
