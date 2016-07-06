class CreateTableCountries < ActiveRecord::Migration
  def change
    create_table :table_countries do |t|
    
      t.string :name
      t.timestamps null: false
       end
    end
end
