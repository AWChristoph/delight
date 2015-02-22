json.array!(@dcards) do |dcard|
  json.extract! dcard, :id, :description
  json.url dcard_url(dcard, format: :json)
end
