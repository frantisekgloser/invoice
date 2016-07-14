json.array!(@cities) do |city|
  json.extract! city, :id, :name, :postal_code, :country_id, :province_id, :user_id
  json.url city_url(city, format: :json)
end
