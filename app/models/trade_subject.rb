class TradeSubject < ActiveRecord::Base
  belongs_to :user

  has_many :ininvoices, :dependent => :destroy 
  has_many :items, :dependent => :destroy
  has_many :outinvoices, :dependent => :destroy
  has_many :payments, :dependent => :destroy 
  has_many :projects, :dependent => :destroy
  
end
