json.array!(@inbills) do |inbill|
  json.extract! inbill, :id, :name, :title, :content, :user_id
  json.url inbill_url(inbill, format: :json)
end
