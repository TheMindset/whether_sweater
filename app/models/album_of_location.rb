# frozen_string_literal: true

class AlbumOfLocation
  def initialize(images)
    @images = images
  end

  def bulk_images
    images.map do |image|
      {
        alt: image[:title],
        url: "https://www.flickr.com/photos/#{image[:owner]}/#{image[:id]}"
      }
    end
  end

  private

  attr_reader :images
end
