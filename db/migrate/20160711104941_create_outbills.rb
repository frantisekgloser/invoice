class CreateOutbills < ActiveRecord::Migration
  def change
  	drop_table :outbills
    create_table :outbills do |t|
      t.string :name
      t.string :title
      t.text :content
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
