json.array!(@vat_charges) do |vat_charge|
  json.extract! vat_charge, :id, :percentage, :country_id, :user_id
  json.url vat_charge_url(vat_charge, format: :json)
end
