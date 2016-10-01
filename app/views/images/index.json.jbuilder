json.array!(@images) do |image|
  json.extract! image, :id, :url, :latitude, :longitude
  json.url image_url(image, format: :json)
end
