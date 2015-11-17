json.array!(@disciplines) do |discipline|
  json.extract! discipline, :id, :title
  json.url discipline_url(discipline, format: :json)
end
