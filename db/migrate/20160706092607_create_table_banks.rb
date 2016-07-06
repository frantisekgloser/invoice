class CreateTableBanks < ActiveRecord::Migration
  def change
    create_table :table_banks do |t|
 
    	t.string :name, null: false
    	t.integer :code, null: false
    	t.integer :IBAN
    	t.integer :SWIFT
 		t.integer :user_id, null: false
		t.timestamps null: false 

    end
  end
end
