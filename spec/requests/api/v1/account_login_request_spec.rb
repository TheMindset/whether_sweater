# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions API endpoints', type: :request do
  let!(:user) { create(:user) }

  it "#login with valid params" do
    login = {
      email: 'test@yopmail.com',
      password: 'password'
    }

    post '/api/v1/sessions', params: login

    expect(response.status).to eq(200)

    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response_body[:api_key]).to eq(user.api_key)
  end

  it '#login with wrong params' do
    login = {
      email: 'hola@yopmail.com'
    }

    post '/api/v1/sessions', params: login

    expect(response.status).to eq(401)

    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response_body[:error]).to eq('Failed to authenticate user')
  end
end
