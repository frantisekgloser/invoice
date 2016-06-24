class AddUserIdToOutbills < ActiveRecord::Migration
  def change
    add_column :outbills, :user_id, :integer
  end
end
