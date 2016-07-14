json.array!(@countries) do |country|
  json.extract! country, :id, :name, :user_id
  json.url country_url(country, format: :json)
end
