# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GeocoderService do
  before do
    stub_json("https://maps.googleapis.com/maps/api/geocode/json?address=Paris&key=#{ENV['GOOGLE_MAPS_API_KEY']}",
              "./fixtures/paris_coords.json")
  end

  let!(:geocoder) { described_class.new('Paris') }

  it "exists" do
    expect(geocoder).to be_a(described_class)
  end

  it '#retreive lat and lond for a specific location' do
    location = geocoder.coords
    expect(location).to be_a(Hash)
    expect(location[:results][0][:geometry][:location][:lat]).to eq(48.856614)
    expect(location[:results][0][:geometry][:location][:lng]).to eq(2.3522219)
  end
end
