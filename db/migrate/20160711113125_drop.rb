class Drop < ActiveRecord::Migration
  def change
  	drop_table :table_addressTypes
  end
end
