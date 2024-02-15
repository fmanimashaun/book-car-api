class CarDetail < ApplicationRecord
  belongs_to :car
  belongs_to :engine_type
end
