json.array!(@payments) do |payment|
  json.extract! payment, :id, :date, :amount, :note, :payment_type_id, :currency_id, :bank_account_id, :trade_subject_id, :vat_report_id, :income_report_id, :user_id
  json.url payment_url(payment, format: :json)
end
