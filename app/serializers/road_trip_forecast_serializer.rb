# frozen_string_literal: true

class RoadTripForecastSerializer
  def self.serialize(retreive_road_trip)
    {
      data: {
        origin: retreive_road_trip.origin,
        destination: retreive_road_trip.destination,
        duration_course: retreive_road_trip.total_duration,
        wheather_on_arrival: {
          summary: retreive_road_trip.arrival_weather[:summary],
          temperature: retreive_road_trip.arrival_weather[:temperature],
          feels_like: retreive_road_trip.arrival_weather[:apparentTemperature],
          visibility_miles: retreive_road_trip.arrival_weather[:visibility],
          uv_index: retreive_road_trip.arrival_weather[:uvIndex]
        }
      }
    }
  end
end
