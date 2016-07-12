class IninvoiceItem < ActiveRecord::Base
  belongs_to :ininvoice
  belongs_to :item
  belongs_to :user
end
