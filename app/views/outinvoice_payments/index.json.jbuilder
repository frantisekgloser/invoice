json.array!(@outinvoice_payments) do |outinvoice_payment|
  json.extract! outinvoice_payment, :id, :amount, :payment_id, outinvoice_id, exchange_rate_id, :user_id
  json.url outinvoice_payment_url(outinvoice_payment, format: :json)
end
