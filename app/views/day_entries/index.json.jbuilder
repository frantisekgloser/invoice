json.array!(@day_entries) do |day_entry|
  json.extract! day_entry, :id, :date, :start, :stop, :invoiced, :task_id, :user_id
  json.url day_entry_url(day_entry, format: :json)
end
