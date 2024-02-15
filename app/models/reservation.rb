class Reservation < ApplicationRecord
  belongs_to :city
  belongs_to :car
  belongs_to :user

  validates :date, :car_id, :city_id, :user_id, presence: true
end
