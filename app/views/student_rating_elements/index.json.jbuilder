json.array!(@student_rating_elements) do |student_rating_element|
  json.extract! student_rating_element, :id, :value
  json.url student_rating_element_url(student_rating_element, format: :json)
end
