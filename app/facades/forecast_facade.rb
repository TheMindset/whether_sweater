# frozen_string_literal: true

class ForecastFacade
  def initialize(location)
    @location = location
  end

  def location_forecast
    LocationForecast.new(forecast)
  end

  private

  def forecast
    dark_sky.retreive_forecast(formatted_lat_long)
  end

  def formatted_lat_long
    lat_long[:lat].to_s + ',' + lat_long[:lng].to_s
  end

  def lat_long
    geocoder.coords[:results][0][:geometry][:location]
  end

  def geocoder
    @geocoder ||= GeocoderService.new(@location)
  end

  def dark_sky
    @dark_sky ||= DarkSkyService.new
  end
end
