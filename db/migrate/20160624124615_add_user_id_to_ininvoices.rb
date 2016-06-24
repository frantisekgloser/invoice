class AddUserIdToIninvoices < ActiveRecord::Migration
  def change
    add_column :ininvoices, :user_id, :integer
  end
end
