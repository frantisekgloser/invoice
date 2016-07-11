class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :inbills, :dependent => :destroy
  has_many :outbills, :dependent => :destroy
  has_many :address_types, :dependent => :destroy
  has_many :banks, :dependent => :destroy
  has_many :countries, :dependent => :destroy
  has_many :currencies, :dependent => :destroy
  has_many :exchange_rates, :dependent => :destroy
  has_many :bank_accounts, :dependent => :destroy
  has_many :payment_types, :dependent => :destroy
  has_many :provinces, :dependent => :destroy
  has_many :cities, :dependent => :destroy
  has_many :city_parts, :dependent => :destroy
  has_many :report_types, :dependent => :destroy
  has_many :reports, :dependent => :destroy
  has_many :streets, :dependent => :destroy   

  has_many :ininvoices, :dependent => :destroy
  has_many :outinvoices, :dependent => :destroy
  has_many :tradeSubjects, :dependent => :destroy

end
