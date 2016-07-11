class ChangeFKeysNames < ActiveRecord::Migration
  def change

  	rename_column :table_addressLinks, :address_type__id, :addressType_id

  	rename_column :table_addressLinks, :house_number__id, :houseNumber_id

  	rename_column :table_ininvoicePayments, :exchange_rate_id, :exchangeRate_id

  	rename_column :table_items, :trade_subject_id, :tradeSubject_id

  	rename_column :table_outinvoicePayments, :exchange_rate_id, :exchangeRate_id

  	rename_column :table_payments, :type_payment_id, :typePayment_id

  	rename_column :table_payments, :bank_account_id, :bankAccount_id

  	rename_column :table_payments, :trade_subject_id, :tradeSubject_id

  	rename_column :table_payments, :vat_report_id, :vatReport_id

  	rename_column :table_payments, :income_report_id, :incomeReport_id

  	rename_column :table_projects, :trade_subject_id, :tradeSubject_id

  	rename_column :table_reports, :report_type_id, :reportType_id

  	rename_column :table_streets, :city_part_id, :cityPart_id

  end
end
