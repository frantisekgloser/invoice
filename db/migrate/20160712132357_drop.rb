class Drop < ActiveRecord::Migration
  def change
  	drop_table :table_payments
  end
end
