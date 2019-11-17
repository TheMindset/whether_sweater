# frozen_string_literal: true

module Api
  module V1
    class BackgroundsController < ApplicationController
      def show
        facade = BackgroundFacade.new(params[:location])
        render json: BackgroundSerializer.new(facade.background_images)
      end
    end
  end
end
