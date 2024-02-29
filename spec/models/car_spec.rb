require 'rails_helper'

RSpec.describe Car, type: :model do
  let(:car) { build(:car) }

  it 'validates presence of name' do
    car.name = nil
    expect(car).not_to be_valid
    expect(car.errors[:name]).to include("can't be blank")
  end

  it 'validates length of name' do
    car.name = 'a' * 256
    expect(car).not_to be_valid
    expect(car.errors[:name]).to include('is too long (maximum is 255 characters)')
  end

  it 'validates presence of description' do
    car.description = nil
    expect(car).not_to be_valid
    expect(car.errors[:description]).to include("can't be blank")
  end

  it 'validates length of description' do
    car.description = 'a' * 256
    expect(car).not_to be_valid
    expect(car.errors[:description]).to include('is too long (maximum is 255 characters)')
  end

  it 'has one car_detail' do
    expect(car).to respond_to(:car_detail)
  end

  it 'has many reservations' do
    expect(car).to respond_to(:reservations)
  end

  describe 'car_image_attached' do
    it 'adds an error if car_image is not attached' do
      car.car_image = nil
      car.valid?
      expect(car.errors[:car_image]).to include('must be attached')
    end

    it 'does not add an error if car_image is attached' do
      car.car_image.attach(io: File.open(Rails.root.join('spec', 'support', 'assets', 'test-image.png')),
                           filename: 'test-image.png', content_type: 'image/png')
      car.valid?
      expect(car.errors[:car_image]).not_to include('must be attached')
    end
  end
end
