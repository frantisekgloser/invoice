class ChangeColumnIban < ActiveRecord::Migration
  def change
  	change_column :bank_accounts, :iban, :string
  end
end
