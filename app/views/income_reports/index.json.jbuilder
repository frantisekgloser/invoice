json.array!(@income_reports) do |income_report|
  json.extract! income_report, :id, :number, :date, :to_pay, :to_receive, :note, :user_id
  json.url income_report_url(income_report, format: :json)
end
