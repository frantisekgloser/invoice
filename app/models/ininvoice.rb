class Ininvoice < ActiveRecord::Base
  belongs_to :insequence
  belongs_to :trade_subject
  belongs_to :currency
  belongs_to :exchange_rate
  belongs_to :user

  has_many :ininvoice_items, :dependent => :destroy
  has_many :ininvoice_payments, :dependent => :destroy
  
end
