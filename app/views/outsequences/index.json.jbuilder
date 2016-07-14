json.array!(@outsequences) do |outsequence|
  json.extract! outsequence, :id, :name, :note, :user_id
  json.url outsequence_url(outsequence, format: :json)
end
