class CreateVatCharges < ActiveRecord::Migration
  def change
  	drop_table :table_vatCharges
    create_table :vat_charges do |t|
      t.float :percentage, null: false
      t.references :country, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
