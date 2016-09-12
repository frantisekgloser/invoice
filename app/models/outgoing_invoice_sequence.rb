class OutgoingInvoiceSequence < ActiveRecord::Base

  belongs_to :user

  has_many :outgoing_invoices, :dependent => :destroy 

  validates_presence_of  :name, :user_id

end
