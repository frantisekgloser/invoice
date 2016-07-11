class CreateReportTypes < ActiveRecord::Migration
  def change
  	drop_table :table_reportTypes
    create_table :report_types do |t|
      t.string :name, null: false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
