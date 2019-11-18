# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Foracast Location API endpoint", type: :request do
  it "#deliver forecast informations about location " do
    VCR.use_cassette('Road_trip_API_endpoint') do
      params = {
        location: "Nairobi"
      }

      get '/api/v1/forecast', params: params

      expect(response.status).to eq(200)

      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(response_body[:data][:attributes][:address]).to eq("Nairobi, Kenya")
    end
  end
end
