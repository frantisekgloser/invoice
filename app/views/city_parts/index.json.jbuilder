json.array!(@city_parts) do |city_part|
  json.extract! city_part, :id, :name, :postal_code, :city_id, :user_id
  json.url city_part_url(city_part, format: :json)
end
