json.array!(@reports) do |report|
  json.extract! report, :id, :date, :to_pay, :to_receive, :report_type_id, :user_id
  json.url report_url(report, format: :json)
end
