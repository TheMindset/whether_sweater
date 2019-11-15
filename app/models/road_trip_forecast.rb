# frozen_string_literal: true

class RoadTripForecast
  attr_reader :origin, :destination

  def initialize(drive, forecast)
    @origin = drive[:start_address]
    @destination = drive[:end_address]
    @total_distance = drive[:distance][:text]
    @total_duration = drive[:duration][:text]
    @forecast = forecast
  end
end
