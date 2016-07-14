json.array!(@streets) do |street|
  json.extract! street, :id, :name, :city_id, :city_part_id, :user_id
  json.url street_url(street, format: :json)
end
