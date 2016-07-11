class CreateCities < ActiveRecord::Migration
  def change
    drop_table :table_cities
    create_table :cities do |t|
      t.string :name, null: false
      t.string :postal_code, null: false
      t.references :country, index: true, foreign_key: true
      t.references :province, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
