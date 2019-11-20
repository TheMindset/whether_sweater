# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DarkSkyService do
  it "retreive forecast for a specific location" do
    dark_sky = described_class.new

    VCR.use_cassette('retreive_forecast_response') do
      response = dark_sky.retreive_forecast("48.856614,2.3522219")

      expect(response).to be_a(Hash)
      expect(response[:latitude]).to eq(48.856614)
      expect(response[:longitude]).to eq(2.3522219)
    end
  end
end
