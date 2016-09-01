class Item < ActiveRecord::Base
  belongs_to :currency
  belongs_to :vat_charge
  belongs_to :trade_subject
  belongs_to :user

  has_many :incomming_invoice_items, :dependent => :destroy
  has_many :outgoing_invoice_items, :dependent => :destroy

end
