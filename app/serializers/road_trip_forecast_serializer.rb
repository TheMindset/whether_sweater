# frozen_string_literal: true

class RoadTripForecastSerializer
  include FastJsonapi::ObjectSerializer

  set_type :road_trip_forecast

  attributes :origin,
             :destination,
             :trip_duration_text,
             :icon,
             :summary,
             :temperature,
             :feels_like,
             :visibility_miles,
             :uv_index
end
