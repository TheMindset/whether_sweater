# frozen_string_literal: true

class LocationForecast
  attr_reader :currently, :hourly, :daily

  def initialize(forecast)
    @currently = forecast[:currently]
    @hourly = forecast[:hourly][:data]
    @daily = forecast[:daily][:data]
  end
end
