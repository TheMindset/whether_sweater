# frozen_string_literal: true

class Geocoder
  def initialize(location)
    @location = location
  end

  def coordinate
    get_json("geocode/json")
  end

  private

  def connection
    @connection = Faradey.new(url: "https://maps.googleapis.com/maps/api/") do |faradey|
      faradey.params["key"] = ENV['GEOCODING_API_KER']
      faradey.params["adress"] = @location
      faradey.adapter Faradey.default_adapter
    end
  end
end
