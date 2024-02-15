class CarDetail < ApplicationRecord
  belongs_to :car
  belongs_to :engine_type
  validates :horsepower, :torque, numericality: { only_integer: true, greater_than: 0 }
  validates :fuel_economy, :seating_capacity, :cargo_space, :infotainment_system, :safety_rating, :tech_features, :special_features, presence: true
  validates :fuel_economy, :cargo_space, length: { maximum: 255 }
end
