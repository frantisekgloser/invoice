class CreateProjects < ActiveRecord::Migration
  def change
  	drop_table :table_projects
    create_table :projects do |t|
      t.string :name, null: false
      t.text :note
      t.references :trade_subject, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
