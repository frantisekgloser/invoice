class Inbill < ActiveRecord::Base
  belongs_to :user

  attr_accessible :name, :title, :content

end
