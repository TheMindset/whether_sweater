# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DarkSkyService, :vcr do
  let!(:dark_sky) { described_class.new }

  it "exists" do
    expect(dark_sky).to be_a(described_class)
  end

  it "retreive forecast for a specific location" do
    forecast = dark_sky.retreive_forecast("48.856614,2.3522219")

    expect(forecast).to be_a(Hash)
    expect(forecast[:latitude]).to eq(48.856614)
    expect(forecast[:longitude]).to eq(2.3522219)
  end
end
