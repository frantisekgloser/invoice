class CreateTableBankAccounts < ActiveRecord::Migration
  def change
    create_table :table_bank_accounts do |t|

    	t.string :name
    	t.string :number, null: false
    	t.integer :IBAN
    	t.integer :bank_id, null: false
    	t.integer :currency_id, null: false    	
 		t.integer :user_id, null: false
		t.timestamps null: false 

    end
  end
end
