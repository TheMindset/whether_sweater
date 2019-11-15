# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DirectionService, :vcr, type: :request do
  road_trip_params = { "origin": "Kigali", "destination": "Nairobi" }

  let!(:road_trip) { described_class.new(road_trip_params) }

  it "exists" do
    expect(road_trip).to be_a(described_class)
  end

  it "retreive the drive for a specific address" do
    direction = road_trip.retreive_road_trip

    expect(direction).to be_a(Hash)
    expect(direction[:start_address]).to eq("Kigali, Rwanda")
    expect(direction[:end_address]).to eq("Nairobi, Kenya")
  end
end
