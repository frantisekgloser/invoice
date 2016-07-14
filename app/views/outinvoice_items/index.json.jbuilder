json.array!(@outinvoice_items) do |outinvoice_item|
  json.extract! outinvoice_item, :id, :amount, :note, :outinvoice_id, :item_id, :user_id
  json.url outinvoice_item_url(outinvoice_item, format: :json)
end
