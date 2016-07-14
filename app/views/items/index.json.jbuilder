json.array!(@address_types) do |address_type|
  json.extract! address_type, :id, :name, :note, :unit_price, :currency_id, :vat_charge_id, :trade_subject_id, :user_id
  json.url address_type_url(address_type, format: :json)
end
