class RepairNames < ActiveRecord::Migration
  def change
    rename_table :ininvoice_items, :incomming_invoice_items
    rename_table :ininvoice_payments, :incomming_invoice_payments
    rename_table :ininvoices, :incomming_invoices
    rename_table :insequences, :incomming_invoice_sequences
    rename_table :outinvoice_items, :outgoing_invoice_items
    rename_table :outinvoice_payments, :outgoing_invoice_payments
    rename_table :outinvoices, :outgoing_invoices
    rename_table :outsequences, :outgoing_invoice_sequences
  end
end
