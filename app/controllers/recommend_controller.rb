class RecommendController < ApplicationController
  def index
    session_id = params['session_id']
    @likes = Like.where(:session_id => session_id, :is_like => true)
    @recommends = []
    @likes.each do |like|
      url = "https://graph.facebook.com/v2.7/search?access_token=EAACEdEose0cBAA3nbwlTVGrWcS8OZAAxGDNLymzCCtJOamZCS6ZBhCUfvNBmxnMDRltVlpKHHzNpqoEx3zrhCJMzsonHSDsPCpuTwZAjcccd6fZBn9H67ZBGTZAl3Gc5b74h8QfywB7CgK4ckTptZBtdE7idpGdWwqa5nNJYcq0NawZDZD&center=#{like.image.latitude}%2C#{like.image.longitude}&debug=all&distance=1000&format=json&method=get&pretty=0&suppress_http_code=1&type=place"
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
