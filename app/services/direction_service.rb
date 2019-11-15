# frozen_string_literal: true

class DirectionService
  def initialize(road_trip_params)
    @origin = road_trip_params[:origin]
    @destination = road_trip_params[:destination]
  end

  def retreive_road_trip
    get_json("directions/json", origin: @origin, destination: @destination, units: "metric")[:routes][0][:legs][0]
  end

  private

  def conn
    @conn ||= Faraday.new(url: "https://maps.googleapis.com/maps/api") do |faraday|
      faraday.params["key"] = ENV['GOOGLE_MAPS_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url, params = {})
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end
end
