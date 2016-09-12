class IncommingInvoice < ActiveRecord::Base

  belongs_to :incomming_invoice_sequence
  belongs_to :trade_subject
  belongs_to :currency
  belongs_to :exchange_rate
  belongs_to :user

  has_many :incomming_invoice_items, :dependent => :destroy
  has_many :incomming_invoice_payments, :dependent => :destroy

  validates_presence_of :number, :generated_on_date, :taxable_supply_date, :due_date, :reverse_charge, :paid, :incomming_invoice_sequence_id, :trade_subject_id, :currency_id, :exchange_rate_id, :user_id

end
