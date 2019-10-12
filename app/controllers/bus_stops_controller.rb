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

  def search
    stop = BusStop.where(number: params[:number]).first

    if (stop != nil) then
      redirect_to stop_path(stop.number)
    end
  end
end