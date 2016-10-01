json.array!(@likes) do |like|
  json.extract! like, :id, :session_id, :image_id, :is_like
  json.url like_url(like, format: :json)
end
