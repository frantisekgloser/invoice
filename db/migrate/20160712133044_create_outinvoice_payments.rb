class CreateOutinvoicePayments < ActiveRecord::Migration
  def change
    drop_table :table_outinvoicePayments
    create_table :outinvoice_payments do |t|
      t.float :amount
      t.references :payment, index: true, foreign_key: true
      t.references :outinvoice, index: true, foreign_key: true
      t.references :exchange_rate, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
