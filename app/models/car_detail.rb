class CarDetail < ApplicationRecord
  belongs_to :car
  belongs_to :engine_type
  validates :car_id, :engine_type_id, presence: true
end
