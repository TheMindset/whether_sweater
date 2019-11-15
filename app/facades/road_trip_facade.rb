# frozen_string_literal: true

class RoadTripFacade
  def initialize(road_trip_params)
    @road_trip_params = road_trip_params
  end

  def retreive_road_trip
    @retreive_road_trip ||= RoadTripForecast.new(drive, forecast)
  end

  private

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
