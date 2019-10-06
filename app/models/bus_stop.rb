class BusStop < ApplicationRecord
  belongs_to :street
  belongs_to :cross_street, class_name: 'Street', foreign_key: 'cross_street_id'
  has_many :variant_schedules
  has_many :variants, through: :variant_schedules
end
