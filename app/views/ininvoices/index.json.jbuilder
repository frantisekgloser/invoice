json.array!(@ininvoices) do |ininvoice|
  json.extract! ininvoice, :id, :name, :title, :content
  json.url ininvoice_url(ininvoice, format: :json)
end
