class Item < ActiveRecord::Base
  belongs_to :currency
  belongs_to :vat_charge
  belongs_to :trade_subject
  belongs_to :user

  has_many :incomming_invoice_items, :dependent => :destroy
  has_many :outgoing_invoice_items, :dependent => :destroy

  validates_presence_of :name, :unit_price, :currency_id, :vat_charge_id, :trade_subject_id, :user_id

end
