class ChangeTableNames < ActiveRecord::Migration
  def change

  	rename_table :table_address_links, :table_addressLinks

  	rename_table :table_address_types, :table_addressTypes

  	rename_table :table_bank_accounts, :table_bankAccounts

  	rename_table :table_citi_parts, :table_citiParts

	rename_table :table_day_entries, :table_dayEntries

	rename_table :table_exchange_rates, :table_exchangeRates

	rename_table :table_house_numbers, :table_houseNumbers

	rename_table :table_ininvoice_items, :table_ininvoiceItems

	rename_table :table_ininvoice_payments, :table_ininvoicePayments

	rename_table :table_outinvoice_items, :table_outinvoiceItems

	rename_table :table_outinvoice_payments, :table_outinvoicePayments

	rename_table :table_payment_types, :table_paymentTypes

	rename_table :table_report_types, :table_reportTypes

	rename_table :table_task_types, :table_taskTypes

	rename_table :table_trade_subjects, :table_tradeSubjects

	rename_table :table_vat_charges, :table_vatCharges

  end
end
