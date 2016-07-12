class Outinvoice < ActiveRecord::Base
  belongs_to :outsequence
  belongs_to :trade_subject
  belongs_to :currency
  belongs_to :exchange_rate
  belongs_to :user

  has_many :outinvoice_items, :dependent => :destroy
  has_many :outinvoice_payments, :dependent => :destroy

end
