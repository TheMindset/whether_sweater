# frozen_string_literal: true

class BackgroundFacade
  def initialize(location)
    @location = location
  end

  def background_images
    images.map do |image|
      AlbumOfLocation.new(image)
    end
  end

  def images
    Rails.cache.fetch("background-images-#{location}", expires_in: 24.hours) do
      flickr.image_search[:photos][:photo][0..10]
    end
  end

  private

  attr_reader :location

  def flickr
    @flickr ||= FlickrService.new(location_lat, location_long)
  end

  def location_lat
    lat_long[:lat].to_s
  end

  def location_long
    lat_long[:lng].to_s
  end

  def lat_long
    geocoder.coords[:results][0][:geometry][:location]
  end

  def geocoder
    @geocoder ||= GeocoderService.new(location)
  end
end
