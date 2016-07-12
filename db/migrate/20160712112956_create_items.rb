class CreateItems < ActiveRecord::Migration
  def change
    drop_table :table_items
    create_table :items do |t|
      t.string :name
      t.text :note
      t.float :unit_price
      t.references :currency, index: true, foreign_key: true
      t.references :vat_charge, index: true, foreign_key: true
      t.references :trade_subject, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
