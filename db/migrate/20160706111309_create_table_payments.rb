class CreateTablePayments < ActiveRecord::Migration
  def change

    create_table :table_payments do |t|

    	t.date :date, null: false
    	t.float :amount, null: false, default: "0,0"
    	t.integer :type_payment_id, null: false
    	t.integer :currency_id, null: false
    	t.integer :bank_account_id, null: false
    	t.integer :trade_subject_id, null: false
    	t.integer :vat_report_id, null: false
    	t.integer :income_report_id, null: false
	  	t.integer :user_id, null: false
	  	t.timestamps null: false 

    end
  end
end
