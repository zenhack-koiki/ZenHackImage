namespace 'images' do
  FlickRaw.api_key = ENV['FLICKR_KEY']
  FlickRaw.shared_secret = ENV['FLICKR_SECRET']

  class FlickrAccessor
    EXTRAS = 'geo,url_l,description,tags'
    LAT = 35.331836
    LON = 139.5531174
    RADIUS = 20
    BASE_PARAMS = {
      text: '鎌倉',
      has_geo: 1,
      lat: LAT,
      lon: LON,
      radius: RADIUS,
      radius_units: 'km',
      extras: EXTRAS
    }

    attr_accessor :list, :page

    def initialize
      @page = 1
    end

    def params
      BASE_PARAMS.merge(page: @page)
    end

    def get
      puts "Page: #{@page}"
      @list = flickr.photos.search params
    end

    def print
      @list.each do |photo|
        image_url = photo['url_l']
        lat =  photo['latitude']
        lon =  photo['longitude']
        next if photo['tags'].nil?

        tags =  photo['tags'].split(' ')
        next if tags.empty?

        image = Image.new(url: image_url, latitude: lat, longitude: lon)
        tags.each { |tag| image.tag_list.add tag }
        image.save
      end
    end
  end

  task flickr: :environment do
    accessor = FlickrAccessor.new
    accessor.get
    accessor.print

    2.upto(accessor.list.pages) do |i|
      accessor.page = i
      accessor.get
      accessor.print
      sleep(1)
    end
  end
end