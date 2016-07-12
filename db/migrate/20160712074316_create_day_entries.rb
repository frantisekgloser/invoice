class CreateDayEntries < ActiveRecord::Migration
  def change
    drop_table :table_dayEntries
    create_table :day_entries do |t|
      t.date :date
      t.time :start
      t.time :stop
      t.boolean :invoiced
      t.references :task, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
