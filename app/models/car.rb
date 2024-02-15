class Car < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_one :car_detail, dependent: :destroy

  accepts_nested_attributes_for :car_detail

  validates :name, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 10 }
end
