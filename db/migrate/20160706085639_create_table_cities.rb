class CreateTableCities < ActiveRecord::Migration
  def change
    create_table :table_cities do |t|

    	t.string :name, null: false
    	t.string :postal_code, null: false
 		t.integer :country_id, null: false, default: "1"
 		t.integer :province_id
		t.timestamps null: false 
		
    end
  end
end
