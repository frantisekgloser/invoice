class Payment < ActiveRecord::Base

  belongs_to :payment_type
  belongs_to :currency
  belongs_to :bank_account
  belongs_to :trade_subject
  belongs_to :vat_report
  belongs_to :income_report
  belongs_to :user

  has_many :incomming_invoice_payments, :dependent => :destroy
  has_many :outgoing_invoice_payments, :dependent => :destroy

  validates_presence_of :date, :amount, :payment_type_id, :currency_id, :bank_account_id, :trade_subject_id, :user_id

end
