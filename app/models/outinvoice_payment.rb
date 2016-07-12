class OutinvoicePayment < ActiveRecord::Base
  belongs_to :payment
  belongs_to :outinvoice
  belongs_to :exchange_rate
  belongs_to :user
end
