class CreateTradeSubjects < ActiveRecord::Migration
  def change
  	drop_table :table_tradeSubjects
    create_table :trade_subjects do |t|
      t.string :name, null: false
      t.integer :identification_number, null: false
      t.integer :vat, null: false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
