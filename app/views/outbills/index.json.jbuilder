json.array!(@outbills) do |outbill|
  json.extract! outbill, :id, :name, :title, :content, :user_id
  json.url outbill_url(outbill, format: :json)
end
