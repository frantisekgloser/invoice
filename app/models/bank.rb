class Bank < ActiveRecord::Base

  belongs_to :user

  has_many :exchange_rates, :dependent => :destroy
  has_many :bank_accounts, :dependent => :destroy

  validates_presence_of :name, :code, :user_id

end
