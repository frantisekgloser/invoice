class CreateTableProvinces < ActiveRecord::Migration
  def change
    create_table :table_provinces do |t|

    	t.string :name
 		t.integer :country_id, null: false, default: "1"
		t.timestamps null: false 
    end
  end
end
