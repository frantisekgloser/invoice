class AddUserIdToInbills < ActiveRecord::Migration
  def change
    add_column :inbills, :user_id, :integer
  end
end
