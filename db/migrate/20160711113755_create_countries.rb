class CreateCountries < ActiveRecord::Migration
  def change
  	drop_table :table_countries
    create_table :countries do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
