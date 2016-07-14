json.array!(@address_links) do |address_link|
  json.extract! address_link, :id, :address_type_id, :house_number_id, :user_id
  json.url address_link_url(address_link, format: :json)
end
