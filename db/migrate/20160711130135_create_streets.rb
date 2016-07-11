class CreateStreets < ActiveRecord::Migration
  def change
  	drop_table :table_streets
    create_table :streets do |t|
      t.string :name, null: false
      t.references :city, index: true, foreign_key: true
      t.references :city_part, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
