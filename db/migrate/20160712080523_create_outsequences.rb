class CreateOutsequences < ActiveRecord::Migration
  def change
    create_table :outsequences do |t|
      t.string :name
      t.text :note
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
