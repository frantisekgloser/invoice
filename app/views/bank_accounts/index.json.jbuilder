json.array!(@bank_accounts) do |bank_account|
  json.extract! bank_account, :id, :name, :number, :iban, :bank_id, :currency_id, :user_id
  json.url bank_account_url(bank_account, format: :json)
end
