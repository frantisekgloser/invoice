class DropLogins < ActiveRecord::Migration
  def change
  	drop_table :logins
  end
end
