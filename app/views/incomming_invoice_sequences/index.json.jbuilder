json.array!(@incomming_invoice_sequences) do |incomming_invoice_sequence|
  json.extract! incomming_invoice_sequence, :id, :name, :note, :user_id
  json.url incomming_invoice_sequence_url(incomming_invoice_sequence, format: :json)
end
