class CarDetail < ApplicationRecord
  belongs_to :car, inverse_of: :car_detail
  belongs_to :engine_type

  validates :horsepower, :torque, numericality: { only_integer: true, greater_than: 0 }
  validates :seating_capacity, :cargo_space, :infotainment_system, :safety_rating, :tech_features,
            :special_features, presence: true
  validates :fuel_economy, :cargo_space, length: { maximum: 255 }

  validates :fuel_economy, presence: true, unless: -> { range.present? }
  validates :range, presence: true, unless: -> { fuel_economy.present? }
end
