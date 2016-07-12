class CreateIninvoices < ActiveRecord::Migration
  def change
    create_table :ininvoices do |t|
      t.integer :number
      t.date :generated_on_date
      t.date :taxable_supply_date
      t.date :due_date
      t.float :total_computed_base
      t.float :total_computed_vat
      t.float :total_corrected_base
      t.float :total_corrected_vat
      t.boolean :reverse_charge
      t.boolean :paid
      t.text :note
      t.binary :original_invoice
      t.string :original_invoice_md5
      t.binary :translated_invoice
      t.string :translated_invoice_md5
      t.references :insequence, index: true, foreign_key: true
      t.references :trade_subject, index: true, foreign_key: true
      t.references :currency, index: true, foreign_key: true
      t.references :exchange_rate, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
