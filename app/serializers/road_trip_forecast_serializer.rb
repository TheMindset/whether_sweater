# frozen_string_literal: true

class RoadTripForecastSerializer
  def self.serialize(retreive_road_trip)
    {
      data: {
        origin: retreive_road_trip.origin,
        destination: retreive_road_trip.destination,
        duration_course: retreive_road_trip.total_duration,
        wheather_on_arrival: {
          summary: retreive_road_trip.summary,
          temperature: retreive_road_trip.temperature,
          feels_like: retreive_road_trip.apparent_temperature,
          visibility_miles: retreive_road_trip.visibility.round(2),
          uv_index: retreive_road_trip.uv_index
        }
      }
    }
  end
end
