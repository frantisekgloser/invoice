class ExchangeRate < ActiveRecord::Base
  belongs_to :bank
  belongs_to :currency
  belongs_to :user

  attr_accessible :rate, :date
    
end
