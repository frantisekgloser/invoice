class IncommingInvoiceSequence < ActiveRecord::Base
  belongs_to :user

  has_many :incomming_invoices, :dependent => :destroy 

  validates_presence_of  :name, :user_id

end
