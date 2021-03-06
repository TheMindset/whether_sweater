# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User API endpoint', type: :request do
  it "#create account with a valid params" do
    params = {
      email: 'test@yopmail.com',
      password: 'password',
      password_confirmation: 'password'
    }

    VCR.use_cassette('account_creation_request_success') do
      post '/api/v1/users', params: params

      expect(response.status).to eq(201)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body).to have_key(:api_key)
    end
  end

  it "#creation account without a valid params" do
    params = {
      email: 'test@yopmail.com'
    }

    VCR.use_cassette('account_creation_request_failure') do
      post '/api/v1/users', params: params

      expect(response.status).to eq(400)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:error]).to eq('Failed to create user')
    end
  end
end
