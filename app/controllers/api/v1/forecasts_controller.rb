# frozen_string_literal: true

module Api
  module V1
    class ForecastsController < ApplicationController
      def show
        facade = ForecastFacade.new(params[:location])
        render json: ForecastSerializer.new(facade.location_forecast)
      end
    end
  end
end
