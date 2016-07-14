json.array!(@insequences) do |insequence|
  json.extract! insequence, :id, :name, :note, :user_id
  json.url insequence_url(insequence, format: :json)
end
