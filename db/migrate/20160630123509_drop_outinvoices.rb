class DropOutinvoices < ActiveRecord::Migration
  def change
 	drop_table :outinvoices
  end
end