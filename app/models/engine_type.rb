class EngineType < ApplicationRecord
  has_many :car_details, dependent: :destroy
end
