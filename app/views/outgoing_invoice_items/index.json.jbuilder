json.array!(@outgoing_invoice_items) do |outgoing_invoice_item|
  json.extract! outgoing_invoice_item, :id, :amount, :note, :outgoing_invoice_id, :item_id, :user_id
  json.url outgoing_invoice_item_url(outgoing_invoice_item, format: :json)
end
