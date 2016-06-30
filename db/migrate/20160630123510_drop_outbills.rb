class DropOutbills < ActiveRecord::Migration
  def change
 	drop_table :outbills
  end
end