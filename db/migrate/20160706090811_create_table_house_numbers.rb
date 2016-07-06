class CreateTableHouseNumbers < ActiveRecord::Migration
  def change
    create_table :table_house_numbers do |t|

     	t.integer :house_number, null: false
 		t.integer :city_id
 		t.integer :street_id
		t.timestamps null: false 

    end
  end
end
