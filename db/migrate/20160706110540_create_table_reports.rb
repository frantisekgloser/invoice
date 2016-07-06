class CreateTableReports < ActiveRecord::Migration
  def change

    create_table :table_reports do |t|

    	t.date :date, null: false
    	t.integer :report_type_id, null: false
    	t.float :to_pay
    	t.float :to_receive

    end
  end
end
