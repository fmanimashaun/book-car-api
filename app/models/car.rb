class Car < ApplicationRecord
  has_many :reservations
  has_many :car_details
end
