class ChangeColumn < ActiveRecord::Migration
  def change
  	change_column :banks, :swift, :string

  	drop_table :inbills
  	drop_table :outbills
  end
end
