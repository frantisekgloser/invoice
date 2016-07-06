class CreateTableItems < ActiveRecord::Migration
  def change
    create_table :table_items do |t|

    	t.string :name, null: false
 		t.text :description
 		t.float :unit_price
 		t.integer :currency_id, null: false
 		t.integer :vat_id, null: false
 		t.integer :trade_subject_id, null: false
 		t.integer :user_id, null: false
		t.timestamps null: false 

    end
  end
end
