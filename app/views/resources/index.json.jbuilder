json.array!(@resources) do |resource|
  json.extract! resource, :title, :summary, :link
  json.url resource_url(resource, format: :json)
end
