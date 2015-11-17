json.array!(@groups) do |group|
  json.extract! group, :id, :numer
  json.url group_url(group, format: :json)
end
