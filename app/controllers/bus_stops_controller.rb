class BusStopsController < ApplicationController
  def index
    @stops = BusStop.page(params[:page]).per(20)
  end

  def show
    @stop = BusStop.where(number: params[:id]).first
  end
end
