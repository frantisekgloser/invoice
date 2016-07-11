class CreatePaymentTypes < ActiveRecord::Migration
  def change
  	drop_table :table_paymentTypes
    create_table :payment_types do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
