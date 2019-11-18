# frozen_string_literal: true

class RoadTripFacade
  def initialize(road_trip_params)
    @road_trip_params = road_trip_params
  end

  def retreive_road_trip
    Rails.cache.fetch("forecast-for-#{road_trip_params[:origin]}-#{road_trip_params[:destination]}", expires_in: 2.minutes) do
      RoadTripForecast.new(drive, forecast)
    end
  end

  private

  attr_reader :road_trip_params

  def drive
    @drive ||= direction.retreive_road_trip
  end

  def forecast
    @forecast ||= ForecastFacade.new(@road_trip_params[:destination]).location_forecast
  end

  def direction
    @direction ||= DirectionService.new(@road_trip_params)
  end
end
