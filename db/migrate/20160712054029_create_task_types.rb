class CreateTaskTypes < ActiveRecord::Migration
  def change
  	drop_table :table_taskTypes
    create_table :task_types do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
