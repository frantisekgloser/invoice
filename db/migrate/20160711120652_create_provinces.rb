class CreateProvinces < ActiveRecord::Migration
  def change
  	drop_table :table_provinces
    create_table :provinces do |t|
      t.string :name
      t.references :country, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
