class CreateExchangeRates < ActiveRecord::Migration
  def change
    drop_table :table_exchangeRates
    create_table :exchange_rates do |t|
      t.float :rate
      t.date :date
      t.references :bank, index: true, foreign_key: true
      t.references :currency, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
