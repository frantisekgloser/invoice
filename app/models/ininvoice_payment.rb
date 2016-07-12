class IninvoicePayment < ActiveRecord::Base
  belongs_to :payment
  belongs_to :ininvoice
  belongs_to :exchange_rate
  belongs_to :user
end
