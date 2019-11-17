# frozen_string_literal: true

class BackgroundSerializer
  def self.serialize(location_of_album)
    {
      data: {
        background_images: location_of_album
      }
    }
  end
end
