# frozen_string_literal: true

class RoadTripForecast
  attr_reader :origin, :destination, :total_duration

  def initialize(drive, forecast)
    @origin = drive[:start_address]
    @destination = drive[:end_address]
    @total_distance = drive[:distance][:text]
    @total_duration = drive[:duration][:text]
    @forecast = forecast
    @duration_drive = drive[:duration][:value]
  end

  def arrival_weather
    @arrival_weather ||= forecast.hourly.min do |forecast|
      (arrival_time - forecast[:time]).abs
    end
  end

  def summary
    arrival_weather[:summary]
  end

  def temperature
    arrival_weather[:temperature]
  end

  def apparent_temperature
    arrival_weather[:apparentTemperature]
  end

  def visibility
    arrival_weather[:visibility]
  end

  def uv_index
    arrival_weather[:uvIndex]
  end

  private

  attr_reader :duration_drive, :forecast

  def arrival_time
    duration_drive + Time.now.to_i
  end
end
