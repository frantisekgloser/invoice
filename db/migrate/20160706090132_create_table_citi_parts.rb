class CreateTableCitiParts < ActiveRecord::Migration
  def change
    create_table :table_citi_parts do |t|

    	t.string :name, null: false
    	t.string :postal_code, null: false
 		t.integer :city_id, null: false
		t.timestamps null: false 
		
    end
  end
end
