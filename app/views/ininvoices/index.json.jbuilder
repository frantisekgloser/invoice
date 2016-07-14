json.array!(@ininvoices) do |ininvoice|
  json.extract! ininvoice, :id, :number, :generated_on_date, :taxable_supply_date, :due_date, :total_computed_base, :total_computed_vat, :total_corrected_base, :total_corrected_vat, :reverse_charge, :paid, :note, :original_invoice, :original_invoice_md5, :translated_invoice, :translated_invoice_md5, :insequence_id, :trade_subject_id, :currency_id, :exchange_rate_id, :user_id
  json.url ininvoice_url(ininvoice, format: :json)
end
