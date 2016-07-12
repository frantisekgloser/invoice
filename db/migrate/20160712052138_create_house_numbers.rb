class CreateHouseNumbers < ActiveRecord::Migration
  def change
  	drop_table :table_houseNumbers
    create_table :house_numbers do |t|
      t.string :house_number, null: false
      t.references :city, index: true, foreign_key: true
      t.references :street, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
