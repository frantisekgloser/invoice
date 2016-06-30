json.array!(@outinvoices) do |outinvoice|
  json.extract! outinvoice, :id, :name, :title, :content, :user_id
  json.url outinvoice_url(outinvoice, format: :json)
end
