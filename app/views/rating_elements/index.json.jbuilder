json.array!(@rating_elements) do |rating_element|
  json.extract! rating_element, :id, :title, :score
  json.url rating_element_url(rating_element, format: :json)
end
