json.array!(@ininvoices) do |ininvoice|
  json.extract! ininvoice, :id, :name, :title, :content, :user_id
  json.url ininvoice_url(ininvoice, format: :json)
end
