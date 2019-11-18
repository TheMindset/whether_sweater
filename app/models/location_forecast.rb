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

  def date
    Time.at(currently[:time]).to_datetime.strftime('%D')
  end

  def time
    Time.at(currently[:time]).to_datetime.strftime('%I:%M %p')
  end

  def summary
    currently[:summary]
  end

  def icon
    currently[:icon]
  end

  def temperature
    currently[:temperature].round
  end

  def forecast_high
    daily[0][:temperatureHigh].round
  end

  def forecast_low
    daily[0][:temperatureLow].round
  end

  def feels_like
    currently[:apparentTemperature].round
  end

  def percent_humidity
    (currently[:humidity] * 100).to_i
  end

  def visibility_miles
    currently[:visibility].round(2)
  end

  def uv_index
    currently[:uvIndex]
  end

  def hourly_forecast
    hourly.map do |forecast|
      {
        time: Time.at(forecast[:time]).to_datetime.strftime('%I:%M %p'),
        temperature: forecast[:temperature].round,
        uv_index: forecast[:uvIndex]
      }
    end
  end

  def daily_forecast
    daily.map do |forecast|
      {
        day: Time.at(forecast[:time]).to_datetime.strftime('%A'),
        summary: forecast[:summary],
        icon: forecast[:icon],
        percent_humidity: (forecast[:humidity] * 100).to_i,
        forecast_high: forecast[:temperatureHigh].round,
        forecast_low: forecast[:temperatureLow].round
      }
    end
  end
end
