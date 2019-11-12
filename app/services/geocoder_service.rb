# frozen_string_literal: true

class GeocoderService
  def initialize(location)
    @location = location
  end

  def coords
    get_json("maps/api/geocode/json")
  end

  private

  def conn
    @conn ||= Faraday.new(url: "https://maps.googleapis.com/") do |faraday|
      faraday.params["key"] = ENV['GEOCODING_API_KEY']
      faraday.params["address"] = @location
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
