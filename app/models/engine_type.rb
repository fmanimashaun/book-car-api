class EngineType < ApplicationRecord
  has_many :car_details, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }
end
