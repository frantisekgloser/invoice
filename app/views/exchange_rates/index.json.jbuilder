json.array!(@exchange_rates) do |exchange_rate|
  json.extract! exchange_rate, :id, :rate, :date, :bank_id, :currency_id, :user_id
  json.url exchange_rate_url(exchange_rate, format: :json)
end
