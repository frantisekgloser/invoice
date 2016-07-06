class CreateTableOutinvoiceItems < ActiveRecord::Migration
  def change
    create_table :table_outinvoice_items do |t|

      	t.integer :outinvoice_id, null: false
      	t.integer :item_id, null: false
      	t.float :amount, null: false
      	t.text :note
	  	t.integer :user_id, null: false
	  	t.timestamps null: false 

    end
  end
end
