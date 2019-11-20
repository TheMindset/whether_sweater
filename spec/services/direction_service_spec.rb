# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DirectionService do
  it "retreive the drive for a specific address" do
    road_trip_params = { "origin": "Kigali", "destination": "Nairobi" }
    road_trip = described_class.new(road_trip_params)

    VCR.use_cassette('direction_service_response') do
      direction = road_trip.retreive_road_trip

      expect(direction).to be_a(Hash)
      expect(direction[:start_address]).to eq("Kigali, Rwanda")
      expect(direction[:end_address]).to eq("Nairobi, Kenya")
    end
  end
end
