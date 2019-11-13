# frozen_string_literal: true

class BackgroundSerializer
  def self.serialize(background_images)
    {
      data: {
        background_images: [
          {
            alt: background_images[0][:title],
            url: "https://www.flickr.com/photos/#{background_images[0][:owner]}/#{background_images[0][:id]}"
          },
          {
            alt: background_images[1][:title],
            url: "https://www.flickr.com/photos/#{background_images[1][:owner]}/#{background_images[1][:id]}",
          },
          {
            alt: background_images[2][:title],
            url: "https://www.flickr.com/photos/#{background_images[2][:owner]}/#{background_images[2][:id]}",
          },
          {
            alt: background_images[3][:title],
            url: "https://www.flickr.com/photos/#{background_images[3][:owner]}/#{background_images[3][:id]}",
          },
          {
            alt: background_images[4][:title],
            url: "https://www.flickr.com/photos/#{background_images[4][:owner]}/#{background_images[4][:id]}",
          },
          {
            alt: background_images[5][:title],
            url: "https://www.flickr.com/photos/#{background_images[5][:owner]}/#{background_images[5][:id]}",
          },
          {
            alt: background_images[6][:title],
            url: "https://www.flickr.com/photos/#{background_images[6][:owner]}/#{background_images[6][:id]}",
          },
          {
            alt: background_images[7][:title],
            url: "https://www.flickr.com/photos/#{background_images[7][:owner]}/#{background_images[7][:id]}",
          }
        ]
      }
    }
  end
end
