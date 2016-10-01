class Image < ActiveRecord::Base
  acts_as_taggable
  reverse_geocoded_by :latitude, :longitude
  validates :url, uniqueness: true, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  def self.findTaggedImage(*tags)
    tags.count.step(1,-1) do |tag_count|
      tags.combination(tag_count).each do |tag_comb|
        images.push( Image.tagged_with( tag_comb, :any => true) )
      end
      images.uniq!
      if images.count > 10
        return images.slice(10..-1)
      end
    end
    return images.uniq
  end
end
