json.array!(@inbills) do |inbill|
  json.extract! inbill, :id, :name, :title, :content
  json.url inbill_url(inbill, format: :json)
end
