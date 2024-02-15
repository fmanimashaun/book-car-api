class Car < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :car_details, dependent: :destroy
end
