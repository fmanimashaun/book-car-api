class Car < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_one :car_detail, dependent: :destroy, inverse_of: :car
  has_one_attached :car_image

  accepts_nested_attributes_for :car_detail

  validates :name, presence: true, length: { minimum: 3, maximum: 255 }
  validates :description, presence: true, length: { minimum: 10, maximum: 255 }
  validate :car_image_attached

  def set_image_url
    self.image_url = Rails.application.routes.url_helpers.url_for(car_image) if car_image.attached?
  end

  private

  def car_image_attached
    errors.add(:car_image, 'must be attached') unless car_image.attached?
  end
end
