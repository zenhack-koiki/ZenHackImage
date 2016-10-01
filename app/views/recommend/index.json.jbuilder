json.array!(@recommends) do |recommend|
  json.extract! recommend, :longitude, :latitude, :spot
end
