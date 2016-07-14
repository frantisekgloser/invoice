json.array!(@trade_subjects) do |trade_subject|
  json.extract! trade_subject, :id, :name, :identification_number, :vat, :user_id
  json.url trade_subject_url(trade_subject, format: :json)
end
