# frozen_string_literal: true

class RoadTripForecastSerializer
  def self.serialize(retreive_road_trip)
    {
      data: {
        origin: retreive_road_trip.origin,
        destination: retreive_road_trip.destination
      }
    }
  end
end
