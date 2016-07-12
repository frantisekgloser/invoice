class CreateOutinvoiceItems < ActiveRecord::Migration
  def change
    drop_table :table_outinvoiceItems
    create_table :outinvoice_items do |t|
      t.float :amount
      t.text :note
      t.references :outinvoice, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
