class RecommendController < ApplicationController
  def index
    session_id = params['session_id']
    @likes = Like.where(:session_id => session_id, :is_like => true)
    @recommends = []
    @likes.each do |like|
      url = "https://graph.facebook.com/v2.7/search?access_token=EAAHJW9ZApoVUBAI3ZAfRkCo4u2BahCHO8KB3Lb7y6wXVp0v7i5zEnpi0TQ8tDFhKX1MWYcN5stcOz3gF0gLpx8kKSQMxYAZBoYb8gxWYv8koC6vNlZBxZA6LGEMhKqZBTSyKeKfFdHE6J0sTlWg3hJvFE2Omkg1nooaDwDRg7Q9gZDZD&center=#{like.image.latitude}%2C#{like.image.longitude}&debug=all&distance=1000&format=json&method=get&pretty=0&suppress_http_code=1&type=place"
      spot = JSON.parse(RestClient.get(url))
      #@recommends << {:longitude => like.image.longitude, :latitude => like.image.latitude, :spot => spot['data'][0]['name']}
      logger.info like.image
      logger.info url
      logger.info spot
      spot_name = spot['data'][0]['name'] unless spot['data'].nil?
      @recommends << {:longitude => like.image.longitude, :latitude => like.image.latitude, :url => like.image.url, :spot => spot_name}
    end
  end
end
