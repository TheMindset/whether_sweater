# frozen_string_literal: true

class RoadTripForecast
  attr_reader :origin,
              :destination,
              :trip_duration_text,
              :id

  def initialize(drive, forecast)
    @origin = drive[:start_address]
    @destination = drive[:end_address]
    @total_distance = drive[:distance][:text]
    @trip_duration_text = drive[:duration][:text]
    @forecast = forecast
    @trip_duration_value = drive[:duration][:value]
  end

  def summary
    arrival_weather[:summary]
  end

  def icon
    arrival_weather[:icon]
  end

  def temperature
    arrival_weather[:temperature]
  end

  def feels_like
    arrival_weather[:apparentTemperature]
  end

  def visibility_miles
    arrival_weather[:visibility]
  end

  def uv_index
    arrival_weather[:uvIndex]
  end

  private

  attr_reader :trip_duration_value, :forecast

  def arrival_weather
    @arrival_weather ||= forecast.hourly.min do |forecast|
      (arrival_time - forecast[:time]).abs
    end
  end

  def arrival_time
    trip_duration_value + Time.now.to_i
  end
end
