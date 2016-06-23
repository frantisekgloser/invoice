json.array!(@outinvoices) do |outinvoice|
  json.extract! outinvoice, :id, :name, :title, :content
  json.url outinvoice_url(outinvoice, format: :json)
end
