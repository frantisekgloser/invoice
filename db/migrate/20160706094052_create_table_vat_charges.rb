class CreateTableVatCharges < ActiveRecord::Migration
  def change
    create_table :table_vat_charges do |t|

    	t.integer :country_id, null: false
    	t.float :percentage, null: false    	
 		t.integer :user_id, null: false
		t.timestamps null: false 

    end
  end
end
