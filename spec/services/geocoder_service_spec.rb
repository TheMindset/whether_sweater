# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GeocoderService do
  it '#retreive lat and long for a specific location' do
    geocoder = described_class.new('Paris')

    VCR.use_cassette('geocoder_service_response') do
      location = geocoder.coords

      expect(location).to be_a(Hash)
      expect(location[:results][0][:geometry][:location][:lat]).to eq(48.856614)
      expect(location[:results][0][:geometry][:location][:lng]).to eq(2.3522219)
    end
  end
end
