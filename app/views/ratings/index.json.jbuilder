json.array!(@ratings) do |rating|
  json.extract! rating, :id, :max_score
  json.url rating_url(rating, format: :json)
end
