json.array!(@provinces) do |province|
  json.extract! province, :id, :name, :country_id, :user_id
  json.url province_url(province, format: :json)
end
