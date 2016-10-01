class Image < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude
  validates :url, uniqueness: true
end
