# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Foracast Location API endpoint", type: :request do
  it "#deliver forecast informations about location " do
    params = {
      location: "Nairobi"
    }

    VCR.use_cassette('forecast_location_success') do
      get '/api/v1/forecast', params: params

      expect(response.status).to eq(200)

      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(response_body[:data][:attributes][:address]).to eq("Nairobi, Kenya")
    end
  end
end
