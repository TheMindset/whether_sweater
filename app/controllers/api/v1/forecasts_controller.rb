# frozen_string_literal: true

module Api
  module V1
    class ForecastsController < ApplicationController
      def show
        coordinate = geocoder(params[:location]).coords[:results][0][:geometry][:location]
        render json: coordinate
      end

      private

      def geocoder(location)
        @geocoder ||= Geocoder.new(location)
      end
    end
  end
end
