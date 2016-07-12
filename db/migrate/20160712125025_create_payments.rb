class CreatePayments < ActiveRecord::Migration
  def change
    create_table :vat_reports do |t|
      t.integer :number
      t.date :date
      t.float :to_pay
      t.float :to_receive
      t.text :note
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end

    create_table :income_reports do |t|
      t.integer :number
      t.date :date
      t.float :to_pay
      t.float :to_receive
      t.text :note
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end

    create_table :payments do |t|
      t.date :date
      t.float :amount
      t.text :note
      t.references :payment_type, index: true, foreign_key: true
      t.references :currency, index: true, foreign_key: true
      t.references :bank_account, index: true, foreign_key: true
      t.references :trade_subject, index: true, foreign_key: true
      t.references :vat_report, index: true, foreign_key: true
      t.references :income_report, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
