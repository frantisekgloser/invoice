json.array!(@vat_reports) do |vat_report|
  json.extract! vat_report, :id, :nuber, :date, :to_pay, :to_receive, :note, :user_id
  json.url vat_report_url(vat_report, format: :json)
end
