class ChangeColumnVat < ActiveRecord::Migration
  def change
  	change_column :trade_subjects, :vat, :string
  end
end
