class CreateTableIninvoicePayments < ActiveRecord::Migration
  def change

    create_table :table_ininvoice_payments do |t|

    	t.float :amount, null: false, default: "0,0"
    	t.integer :payment_id, null: false
    	t.integer :ininvoice_id, null: false
		t.integer :exchange_rate_id, null: false
	  	t.integer :user_id, null: false
	  	t.timestamps null: false 

    end
  end
end
