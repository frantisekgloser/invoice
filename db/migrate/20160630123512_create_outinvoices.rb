class CreateOutinvoices < ActiveRecord::Migration
  def change
    create_table :outinvoices do |t|
      t.string :name
      t.string :title
      t.text :content
      t.timestamps null: false
      t.string :user_id, :null => false
    end
  end
end
