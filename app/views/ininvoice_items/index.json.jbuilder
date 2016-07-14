json.array!(@ininvoice_items) do |ininvoice_item|
  json.extract! ininvoice_item, :id, :amount, :note, :ininvoice_id, :item_id, :user_id
  json.url ininvoice_item_url(ininvoice_item, format: :json)
end
