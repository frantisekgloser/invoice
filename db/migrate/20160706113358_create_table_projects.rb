class CreateTableProjects < ActiveRecord::Migration
  def change

    create_table :table_projects do |t|

    	t.integer :trade_subject_id, null: false
    	t.string :name, null: false
    	t.text :note
    	t.integer :user_id, null: false
	  	t.timestamps null: false 

    end
  end
end
