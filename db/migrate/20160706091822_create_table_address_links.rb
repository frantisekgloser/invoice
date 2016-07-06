class CreateTableAddressLinks < ActiveRecord::Migration
  def change
    create_table :table_address_links do |t|

 		t.integer :address_type__id, null: false, default: "1"
 		t.integer :house_number__id, null: false
 		t.integer :user_id, null: false
		t.timestamps null: false 

    end
  end
end
