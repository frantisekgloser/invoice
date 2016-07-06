class RecreateTableOutinvoices < ActiveRecord::Migration
  def create

    create_table :outinvoices do |t|

      t.string :sequence_number, null: false
      t.integer :trade_subject_id, null: false
      t.integer :currency_id, null: false
      t.integer :exchange_rate_id, null: false
      t.date :generated_on_date, null: false
      t.date :taxable_supply_date, null: false
      t.date :due_date, null: false
      t.float :total_computed_base_amount, null: false
      t.float :total_computed_vat, null: false
      t.float :total_corrected_base_amount, null: false
      t.float :total_corrected_vat, null: false
      t.boolean :reverse_charge, default: false
      t.boolean :paid, default: false
      t.text :note
	  t.bytea :original_invoice
	  t.string :original_invoice_md5
	  t.bytea :translated_invoice
	  t.string :translated_invoice_md5	  		  	  
	  t.integer :user_id, null: false
	  t.timestamps null: false 

	end  	
  end
end
