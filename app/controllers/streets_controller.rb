class StreetsController < ApplicationController
  def index
    @streets = Street.order("name").page(params[:page]).per(20)
  end

  def show
    @street = Street.find(params[:id])
    @cross_street_stops = BusStop.where(cross_street: @street)
  end

  def search
    name = params[:name]
    street = Street.where(name: name).first

    if (street == nil) then
      
    end

    if (street != nil) then
      redirect_to street_path(street.id)
    end
  end
end
