class CreateBankAccounts < ActiveRecord::Migration
  def change
    drop_table :table_bankAccounts
    create_table :bank_accounts do |t|
      t.string :name
      t.string :number
      t.integer :iban
      t.references :bank, index: true, foreign_key: true
      t.references :currency, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
