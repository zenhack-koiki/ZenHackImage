class RecommendController < ApplicationController
  def index
    session_id = params['session_id']
    @likes = Like.where(:session_id => session_id, :is_like => true)
    @recommends = []
    @likes.each do |like|
      url = "https://graph.facebook.com/v2.7/search?access_token=EAACEdEose0cBANkE1vl0oG8kDFN4oJjIZBiy9gr2wuOwEEGlnscZCuMZACOjnN2RGfuk9uCYnpCm2cv6UO8yn9qHvUfNU6f4mBMcJjMGZAJYY2vbdn0heYNI4M2vDR4OHyxjrnqARjksgpWqRA6VJyOGl8LkXXiJZCRejgE64KAZDZD&center=#{like.image.latitude}%2C#{like.image.longitude}&debug=all&distance=1000&format=json&method=get&pretty=0&suppress_http_code=1&type=place"
      spot = JSON.parse(RestClient.get(url))
      #@recommends << {:longitude => like.image.longitude, :latitude => like.image.latitude, :spot => spot['data'][0]['name']}
      logger like.image
      logger spot
      @recommends << {:longitude => like.image.longitude, :latitude => like.image.latitude, :url => like.image.url}
    end
  end
end
