# frozen_string_literal: true

class LocationForecast
  attr_reader :id, :currently, :hourly, :daily, :address

  def initialize(location_address, forecast)
    @id = nil
    @address = location_address
    @currently = forecast[:currently]
    @hourly = forecast[:hourly][:data][0..7]
    @daily = forecast[:daily][:data][1..5]
  end

  def time_units
    currently[:time]
  end

  def summary
    currently[:summary]
  end

  def icon
    currently[:icon]
  end

  def temp
    currently[:temperature]
  end

  def forecast_high
    daily[0][:temperatureHigh]
  end

  def forecast_low
    daily[0][:temperatureLow]
  end

  def feels_like
    currently[:apparentTemperature]
  end

  def percent_humidity
    currently[:humidity]
  end

  def visibility_miles
    currently[:visibility]
  end

  def uv_index
    currently[:uvIndex]
  end
end
