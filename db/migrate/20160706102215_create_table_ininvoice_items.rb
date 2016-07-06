class CreateTableIninvoiceItems < ActiveRecord::Migration
  def change

    create_table :table_ininvoice_items do |t|

      	t.integer :ininvoice_id, null: false
      	t.integer :item_id, null: false
      	t.float :amount, null: false
      	t.text :note
	  	t.integer :user_id, null: false
	  	t.timestamps null: false 

    end
  end
end
