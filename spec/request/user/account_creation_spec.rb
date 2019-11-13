# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User API endpoint', type: :feature do
  it "#create account with a valid params" do
    params = {
      email: 'test@yopmail.com',
      password: 'password',
      password_confirmation: 'password'
    }

    post '/api/v1/users', params: params

    expect(repsonse).to be_successful

    response_body = JSON.parse(repsonse.body, symbolize_names: true)

    expect(response_body).to have_key(:api_key)
  end

  it "#creation account without a valid params" do
    params = {
      email: 'test@yopmail.com'
    }

    post '/api/v1/users', params: params

    expect(repsonse.status).to eq(400)

    response_body = JSON.parse(repsonse.body, symbolize_names: true)

    expect(response_body[:error]).to eq('Failed to create user')
  end
end
