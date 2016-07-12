class Insequence < ActiveRecord::Base
  belongs_to :user

  has_many :ininvoices, :dependent => :destroy 

end
