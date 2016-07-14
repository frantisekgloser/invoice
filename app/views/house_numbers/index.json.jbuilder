json.array!(@house_numbers) do |house_number|
  json.extract! house_number, :id, :house_number, :city_id, :street_id, :user_id
  json.url house_number_url(house_number, format: :json)
end
