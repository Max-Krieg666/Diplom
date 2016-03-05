json.array!(@documents) do |document|
  json.extract! document, :id, :file, :created_at, :updated_at
  json.url document_url(document, format: :json)
end
