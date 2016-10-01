class Image < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude
  validates :url, uniqueness: true, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
