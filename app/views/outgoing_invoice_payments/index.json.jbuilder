json.array!(@outgoing_invoice_payments) do |outgoing_invoice_payment|
  json.extract! outgoing_invoice_payment, :id, :amount, :payment_id, outgoing_invoice_id, exchange_rate_id, :user_id
  json.url outgoing_invoice_payment_url(outgoing_invoice_payment, format: :json)
end
