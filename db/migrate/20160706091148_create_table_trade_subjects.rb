class CreateTableTradeSubjects < ActiveRecord::Migration
  def change
    create_table :table_trade_subjects do |t|

     	t.string :name, null: false
 		t.integer :identification_number, null: false
 		t.integer :VAT
 		t.integer :user_id, null: false
		t.timestamps null: false 

    end
  end
end
