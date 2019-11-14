# frozen_string_literal: true

module Api
  module V1
    class RoadTripsController < ApplicationController
      def create
        user = User.find_by(api_key: params[:api_key])

        if user
          facade = RoadTripFacade.new(road_trip_params)
          render json: RoadTripForecastSerializer.new(facade.road_trip_forecast)
        end
      end

      private

      def road_trip_params
        params.permit(:origin, :destination)
      end
    end
  end
end
