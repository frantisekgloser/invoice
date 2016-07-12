class CreateTasks < ActiveRecord::Migration
  def change
    drop_table :table_tasks
    create_table :tasks do |t|
      t.string :name, null: false
      t.string :link
      t.text :note
      t.references :project, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
