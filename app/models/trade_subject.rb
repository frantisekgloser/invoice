class TradeSubject < ActiveRecord::Base
  belongs_to :user

  has_many :incomming_invoices, :dependent => :destroy 
  has_many :items, :dependent => :destroy
  has_many :outgoing_invoices, :dependent => :destroy
  has_many :payments, :dependent => :destroy 
  has_many :projects, :dependent => :destroy
  
end
