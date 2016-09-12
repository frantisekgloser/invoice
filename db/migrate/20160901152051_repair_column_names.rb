class RepairColumnNames < ActiveRecord::Migration
  def change
    rename_column :incomming_invoice_items, :ininvoice_id, :incomming_invoice_id
    rename_column :incomming_invoice_payments, :ininvoice_id, :incomming_invoice_id
    rename_column :incomming_invoices, :insequence_id, :incomming_invoice_sequence_id
    rename_column :outgoing_invoice_items, :outinvoice_id, :outgoing_invoice_id
    rename_column :outgoing_invoice_payments, :outinvoice_id, :outgoing_invoice_id
    rename_column :outgoing_invoices, :outsequence_id, :outgoing_invoice_sequence_id
  end
end
