class BusStopsController < ApplicationController
  def index
    @stops = BusStop.page(params[:page]).per(20)
  end

  def show
    @stop = BusStop.where(number: params[:id]).first
    @routes = @stop.routes
    key = Rails.application.credentials.dig(:google_maps_api_key)
    @map_image_url = BusStopsHelper.sign_static_map_url(@stop)
  end
end