class CreateTableExchangeRates < ActiveRecord::Migration
  def change
    create_table :table_exchange_rates do |t|

    	t.float :rate
    	t.integer :bank_id, null: false
    	t.integer :currency_id, null: false    	
		t.date :date
 		t.integer :user_id, null: false
		t.timestamps null: false 

    end
  end
end
