class BusRoute < ApplicationRecord
  has_many :variants

  def stops
    BusStop.find_by_sql("SELECT DISTINCT bus_stops.id, bus_stops.number, bus_stops.name, street_id, cross_street_id, side, direction, latitude, longitude
                          FROM bus_stops
                            INNER JOIN variant_schedules ON bus_stops.id = variant_schedules.bus_stop_id
                            INNER JOIN variants ON variant_schedules.variant_id = variants.id
                          WHERE variants.bus_route_id = #{id}")
  end
end
