# frozen_string_literal: true

class ForecastFacade
  def initialize(location)
    @location = location
  end

  def location_forecast
    Rails.cache.fetch("forecast-locaction-for-#{location}", expires_in: 2.minutes)
    LocationForecast.new(location_address, forecast)
  end

  private

  attr_reader :location

  def location_address
    geocoder.coords[:results][0][:formatted_address]
  end

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
