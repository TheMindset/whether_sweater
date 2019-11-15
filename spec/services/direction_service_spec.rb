# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DirectionService do
  before do
    stub_json("https://maps.googleapis.com/maps/api/directions/json?origin=Kigali&destination=Nairobi&key=AIzaSyCAz5bajiZdnlec9CPk-RFpW4ZvIcjBmJk&units=metric", "./fixtures/direction.json")
  end

  road_trip_params = { "origin": "Kigali", "destination": "Nairobi" }

  let!(:road_trip) { described_class.new(road_trip_params) }

  it "exists" do
    expect(road_trip).to be_a(described_class)
  end

  it "retreive images for a specific location" do
    direction = road_trip.retreive_road_trip

    expect(direction).to be_a(Hash)
    # expect(first_picture[:photos][:photo][0][:id]).to eq("45076145644")
    # expect(first_picture[:photos][:photo][0][:title]).to eq("Paris sera toujours Paris")
  end
end
