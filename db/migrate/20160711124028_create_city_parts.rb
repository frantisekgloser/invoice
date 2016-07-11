class CreateCityParts < ActiveRecord::Migration
  def change
  	drop_table :table_citiParts
    create_table :city_parts do |t|
      t.string :name, null: false
      t.string :postal_code, null: false
      t.references :city, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
