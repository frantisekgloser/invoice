class Country < ActiveRecord::Base

  belongs_to :user

  has_many :cities, :dependent => :destroy
  has_many :provinces, :dependent => :destroy  
  has_many :vat_charges, :dependent => :destroy   

  validates_presence_of :name, :user_id

end
