# frozen_string_literal: true

class AlbumOfLocation
  attr_reader :id, :alt, :url

  def initialize(image)
    @id = nil
    @alt = image[:title]
    @url = "https://farm#{image[:farm]}.staticflickr.com/#{image[:server]}/#{image[:id]}_#{image[:secret]}.jpg"
  end
end
