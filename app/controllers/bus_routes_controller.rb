class BusRoutesController < ApplicationController
  def index
    @bus_routes = BusRoute.page(params[:page]).per(20)
  end

  def show
    @bus_route = BusRoute.where(number: params[:id]).first
    @variants = @bus_route.variants
  end
end
