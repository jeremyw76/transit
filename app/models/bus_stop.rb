class BusStop < ApplicationRecord
  belongs_to :street
  belongs_to :cross_street, class_name: 'Street', foreign_key: 'cross_street_id'
  has_many :variant_schedules
  has_many :variants, through: :variant_schedules

  def routes
    BusRoute.find_by_sql("SELECT DISTINCT bus_routes.id, bus_routes.number, bus_routes.name, bus_routes.customer_type, bus_routes.coverage
                                    FROM bus_routes
                                      INNER JOIN variants ON bus_routes.id = variants.bus_route_id
                                      INNER JOIN variant_schedules ON variants.id = variant_schedules.variant_id
                                    WHERE variant_schedules.bus_stop_id = #{id}")
  end
end
