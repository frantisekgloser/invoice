class CreateOutbills < ActiveRecord::Migration
  def change
    create_table :outbills do |t|
      t.string :name
      t.string :title
      t.text :content
      t.timestamps null: false
      t.string :user_id, :null => false
    end
  end
end