json.array!(@outgoing_invoice_sequences) do |outgoing_invoice_sequence|
  json.extract! outgoing_invoice_sequence, :id, :name, :note, :user_id
  json.url outgoing_invoice_sequence_url(outgoing_invoice_sequence, format: :json)
end
