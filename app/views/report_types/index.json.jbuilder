json.array!(@report_types) do |report_type|
  json.extract! report_type, :id, :name, :user_id
  json.url report_type_url(report_type, format: :json)
end
