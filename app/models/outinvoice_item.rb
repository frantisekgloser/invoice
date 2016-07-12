class OutinvoiceItem < ActiveRecord::Base
  belongs_to :outinvoice
  belongs_to :item
  belongs_to :user
end
