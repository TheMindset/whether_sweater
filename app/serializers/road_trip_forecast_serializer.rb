# frozen_string_literal: true

class RoadTripForecastSerializer
  include FastJsonapi::ObjectSerializer

  set_type :road_trip_forecast

  attributes :origin,
             :destination,
             :trip_duration_text

  attribute :icon

  attribute :summary

  attribute :temperature do |object|
    object.temperature.round
  end

  attribute :feels_like do |object|
    object.feels_like.round
  end

  attribute :visibility_miles do |object|
    object.visibility_miles.round(2)
  end

  attribute :uv_index
end
