# frozen_string_literal: true

module Api
  module V1
    class RoadTripsController < ApplicationController
      def create
        user = User.find_by(api_key: params[:api_key])

        if user
          facade = RoadTripFacade.new(road_trip_params)
          render json: RoadTripForecastSerializer.serialize(facade.retreive_road_trip), status: 200
        else
          render json: { error: 'Unauthorized API KEY' }, status: 401
        end
      end

      private

      def road_trip_params
        params.permit(:origin, :destination)
      end
    end
  end
end
