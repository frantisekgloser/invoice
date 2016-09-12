json.array!(@incomming_invoice_payments) do |incomming_invoice_payment|
  json.extract! incomming_invoice_payment, :id, :amount, :payment_id, incomming_invoice_id, exchange_rate_id, :user_id
  json.url incomming_invoice_payment_url(incomming_invoice_payment, format: :json)
end
