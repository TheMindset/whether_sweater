# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Road trip API endpoint', :vcr, type: :request do
  let!(:user) { create(:user) }

  it "#deliver informations about raod trip when valid params is sent" do
    params = {
      api_key: user.api_key,
      origin: 'Paris',
      destination: 'Lyon'
    }

    post '/api/v1/road_trip', params: params

    expect(response.status).to eq(200)

    response_body = JSON.parse(response.body, symbolize_names: true)
    expect(response_body[:data][:origin]).to eq("Paris, France")
    expect(response_body[:data][:destination]).to eq("Lyon, France")
  end
end