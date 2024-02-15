class Car < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :car_details, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 10 }
end
