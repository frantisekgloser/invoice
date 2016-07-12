class Item < ActiveRecord::Base
  belongs_to :currency
  belongs_to :vat_charge
  belongs_to :trade_subject
  belongs_to :user

  has_many :ininvoice_items, :dependent => :destroy
  has_many :outinvoice_items, :dependent => :destroy

end
