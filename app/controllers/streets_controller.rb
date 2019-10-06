class StreetsController < ApplicationController
  def index
    @streets = Street.order("name").page(params[:page]).per(20)
  end

  def show
    @street = Street.find(params[:id])
    @cross_street_stops = BusStop.where(cross_street: @street)
  end
end
