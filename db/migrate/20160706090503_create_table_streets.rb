class CreateTableStreets < ActiveRecord::Migration
  def change
    create_table :table_streets do |t|

     	t.string :name, null: false
 		t.integer :city_id, null: false
 		t.integer :city_part_id
		t.timestamps null: false 

    end
  end
end
