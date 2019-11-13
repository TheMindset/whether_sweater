# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecasts#show'
      get 'background', to: 'backgrounds#show'
    end
  end
end
