class Payment < ActiveRecord::Base
  belongs_to :payment_type
  belongs_to :currency
  belongs_to :bank_account
  belongs_to :trade_subject
  belongs_to :vat_report
  belongs_to :income_report
  belongs_to :user

  has_many :ininvoice_payments, :dependent => :destroy
  has_many :outinvoice_payments, :dependent => :destroy

end
