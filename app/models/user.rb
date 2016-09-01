class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :address_links, :dependent => :destroy
  has_many :address_types, :dependent => :destroy
  has_many :bank_accounts, :dependent => :destroy
  has_many :banks, :dependent => :destroy
  has_many :cities, :dependent => :destroy
  has_many :city_parts, :dependent => :destroy
  has_many :countries, :dependent => :destroy
  has_many :currencies, :dependent => :destroy
  has_many :day_entries, :dependent => :destroy
  has_many :exchange_rates, :dependent => :destroy
  has_many :house_numbers, :dependent => :destroy   
  has_many :income_reports, :dependent => :destroy
  has_many :incomming_invoice_items, :dependent => :destroy
  has_many :incomming_invoice_payments, :dependent => :destroy
  has_many :incomming_invoices, :dependent => :destroy  
  has_many :incomming_invoice_sequences, :dependent => :destroy
  has_many :items, :dependent => :destroy
  has_many :outgoing_invoice_items, :dependent => :destroy
  has_many :outgoing_invoice_payments, :dependent => :destroy
  has_many :outgoing_invoices, :dependent => :destroy 
  has_many :outgoing_invoice_sequences, :dependent => :destroy
  has_many :payment_types, :dependent => :destroy
  has_many :payments, :dependent => :destroy
  has_many :projects, :dependent => :destroy
  has_many :provinces, :dependent => :destroy
  has_many :report_types, :dependent => :destroy
  has_many :reports, :dependent => :destroy
  has_many :streets, :dependent => :destroy   
  has_many :task_types, :dependent => :destroy   
  has_many :tasks, :dependent => :destroy   
  has_many :trade_subjects, :dependent => :destroy   
  has_many :vat_charges, :dependent => :destroy   
  has_many :vat_reports, :dependent => :destroy

end
