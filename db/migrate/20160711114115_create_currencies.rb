class CreateCurrencies < ActiveRecord::Migration
  def change
  	drop_table :table_currencies
    create_table :currencies do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
