json.array!(@banks) do |bank|
  json.extract! bank, :id, :name, :code, :swift, :user_id
  json.url bank_url(bank, format: :json)
end
