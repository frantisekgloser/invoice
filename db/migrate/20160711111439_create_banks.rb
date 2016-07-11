class CreateBanks < ActiveRecord::Migration
  def change
  	drop_table :table_banks
    create_table :banks do |t|
      t.string :name
      t.integer :code
      t.integer :swift
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
