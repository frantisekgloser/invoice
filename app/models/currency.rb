class Currency < ActiveRecord::Base
  belongs_to :user

  has_many :bank_accounts, :dependent => :destroy
  has_many :exchange_rates, :dependent => :destroy
  has_many :ininvoices, :dependent => :destroy 
  has_many :items, :dependent => :destroy 
  has_many :outinvoices, :dependent => :destroy 
  has_many :payments, :dependent => :destroy

end
