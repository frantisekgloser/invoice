class CreateTablePaymentTypes < ActiveRecord::Migration
  def change

    create_table :table_payment_types do |t|

      	t.string :name, null: false
 		t.integer :user_id, null: false
		t.timestamps null: false 

    end
  end
end
