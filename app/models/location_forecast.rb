# frozen_string_literal: true

class LocationForecast
  attr_reader :currently, :hourly, :daily

  def initialize(forecast)
    @currently = forecast[:currently]
    @hourly = forecast[:hourly][:data][0..7]
    @daily = forecast[:daily][:data][1..5]
  end
end
