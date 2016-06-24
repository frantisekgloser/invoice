class AddUserIdToOutinvoices < ActiveRecord::Migration
  def change
    add_column :outinvoices, :user_id, :integer
  end
end
