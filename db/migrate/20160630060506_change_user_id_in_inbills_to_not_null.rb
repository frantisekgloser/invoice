class ChangeUserIdInInbillsToNotNull < ActiveRecord::Migration
   def change
    change_column_null :inbills, :user_id, false
  end
end
