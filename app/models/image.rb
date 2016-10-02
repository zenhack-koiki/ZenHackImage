class Image < ActiveRecord::Base
  acts_as_taggable
  reverse_geocoded_by :latitude, :longitude
  validates :url, uniqueness: true, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  def self.findTaggedImage(*tags)
    images = []
    tags.count.step(1,-1) do |tag_count|
      tags.combination(tag_count).to_a.each do |tag_comb|
        Image.tagged_with( tag_comb, :any => true).each do |image|
          images.push(image) unless images.include?(image)
        end
      end
      if images.count > 10
        return images.slice(0..10)
        # array_to_return = []
        # images.each_with_index do |image, index|
        #   if index < 10
        #     array_to_return.push(image)
        #   end
        # end
        # return array_to_return
      end
    end
    return images.slice(0..10)
  end
end

