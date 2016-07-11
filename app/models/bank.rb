class Bank < ActiveRecord::Base
  belongs_to :user

  has_many :exchange_rates, :dependent => :destroy
  has_many :bank_accounts, :dependent => :destroy

  attr_accessible :name, :code, :swift
end
