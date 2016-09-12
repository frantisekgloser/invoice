json.array!(@incomming_invoice_items) do |incomming_invoice_item|
  json.extract! incomming_invoice_item, :id, :amount, :note, :incomming_invoice_id, :item_id, :user_id
  json.url incomming_invoice_item_url(incomming_invoice_item, format: :json)
end
