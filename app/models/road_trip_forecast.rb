# frozen_string_literal: true

class RoadTripForecast
  attr_reader :origin,
              :destination,
              :trip_duration_text,
              :summary,
              :icon,
              :temperature,
              :feels_like,
              :visibility_miles,
              :uv_index,
              :id

  def initialize(drive, forecast)
    @origin = drive[:start_address]
    @destination = drive[:end_address]
    @total_distance = drive[:distance][:text]
    @trip_duration_text = drive[:duration][:text]
    @forecast = forecast
    @trip_duration_value = drive[:duration][:value]
    @summary = arrival_weather[:summary]
    @icon = arrival_weather[:icon]
    @temperature = arrival_weather[:temperature]
    @feels_like = arrival_weather[:apparentTemperature]
    @visibility_miles = arrival_weather[:visibility]
    @uv_index = arrival_weather[:uvIndex]
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
