class CreateReports < ActiveRecord::Migration
  def change
    drop_table :table_reports
    create_table :reports do |t|
      t.date :date
      t.float :to_pay
      t.float :to_receive
      t.references :report_type, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
