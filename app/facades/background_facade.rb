# frozen_string_literal: true

class BackgroundFacade
  def initialize(location)
    @location = location
  end

  def background_images
    @background_images ||= flickr.image_search[:photos][:photo]
  end

  private

  def flickr
    @flickr ||= FlickrService.new(location_lat, location_long,)
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
    @geocoder ||= GeocoderService.new(@location)
  end
end
