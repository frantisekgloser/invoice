json.array!(@ininvoice_payments) do |ininvoice_payment|
  json.extract! ininvoice_payment, :id, :amount, :payment_id, ininvoice_id, exchange_rate_id, :user_id
  json.url ininvoice_payment_url(ininvoice_payment, format: :json)
end
