json.array!(@sections) do |section|
  json.extract! section, :id, :title, :content
  json.url section_url(section, format: :json)
end
