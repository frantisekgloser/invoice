class CreateInbills < ActiveRecord::Migration
  def change
 	drop_table :inbills
    create_table :inbills do |t|
      t.string :name
      t.string :title
      t.text :content
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
