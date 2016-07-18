class AddInvoicingDataToUser < ActiveRecord::Migration
  def change
add_column :users, :street, :string
  	add_column :users, :trade_subject, :string
  	add_column :users, :identification_number, :string
  	add_column :users, :vat, :string
  	add_column :users, :house_number, :string
  	add_column :users, :city_part, :string
  	add_column :users, :city, :string
  	add_column :users, :postal_code, :string
  	add_column :users, :province, :string
  	add_column :users, :country, :string
  	add_column :users, :phone, :string
  	add_column :users, :mail, :string
  	add_column :users, :web, :string
  	add_column :users, :note, :text
  	add_column :users, :bank, :string
  	add_column :users, :bank_account, :string
  	add_column :users, :iban, :string
  	add_column :users, :swift, :string
  end
end
