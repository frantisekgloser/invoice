class CreateTableDayEntries < ActiveRecord::Migration
  def change
 
    create_table :table_day_entries do |t|
 
   		t.integer :task_id, null: false
   		t.date :date
   		t.time :start
   		t.time :stop
   		t.boolean :invoiced, default: false
    	t.integer :user_id, null: false
	  	t.timestamps null: false 

    end
  end
end
