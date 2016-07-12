class CreateAddressLinks < ActiveRecord::Migration
  def change
  	drop_table :table_addressLinks
    create_table :address_links do |t|
      t.references :address_type, index: true, foreign_key: true
      t.references :house_number, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
