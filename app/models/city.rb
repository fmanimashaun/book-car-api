class City < ApplicationRecord
  has_many :reservations, dependent: :destroy
end
