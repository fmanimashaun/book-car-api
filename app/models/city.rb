class City < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :name, presence: true, type: String, length: { minimum: 1 }
end
