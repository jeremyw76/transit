class Variant < ApplicationRecord
  belongs_to :bus_route
  has_many :variant_schedules
  has_many :bus_stops, through: :variant_schedules
end
