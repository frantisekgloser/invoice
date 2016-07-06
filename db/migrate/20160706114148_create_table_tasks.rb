class CreateTableTasks < ActiveRecord::Migration
  def change

    create_table :table_tasks do |t|

   		t.string :name, null: false
   		t.integer :project_id, null: false
   		t.string :link
    	t.integer :user_id, null: false
	  	t.timestamps null: false 
	  	
    end
  end
end
