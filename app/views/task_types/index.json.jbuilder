json.array!(@task_types) do |task_type|
  json.extract! task_type, :id, :name, :user_id
  json.url task_type_url(task_type, format: :json)
end
