require 'rails_helper'

RSpec.describe CarDetail, type: :model do
  before do
    allow_any_instance_of(Car).to receive(:set_image_url)
  end

  let(:car) { build_stubbed(:car) }
  let(:car_detail) { build_stubbed(:car_detail, car:) }

  it 'validates presence of seating_capacity' do
    car_detail.seating_capacity = nil
    expect(car_detail).not_to be_valid
    expect(car_detail.errors[:seating_capacity]).to include("can't be blank")
  end

  it 'validates numericality of horsepower' do
    car_detail.horsepower = 'abc'
    expect(car_detail).not_to be_valid
    expect(car_detail.errors[:horsepower]).to include('is not a number')
  end

  it 'validates presence of fuel_economy unless range is present' do
    car_detail.fuel_economy = nil
    car_detail.range = nil
    expect(car_detail).not_to be_valid
    expect(car_detail.errors[:fuel_economy]).to include("can't be blank")
  end

  it 'validates presence of range unless fuel_economy is present' do
    car_detail.range = nil
    car_detail.fuel_economy = nil
    expect(car_detail).not_to be_valid
    expect(car_detail.errors[:range]).to include("can't be blank")
  end

  it 'is valid when only fuel_economy is present' do
    car_detail.range = nil
    car_detail.fuel_economy = '30 mpg'
    expect(car_detail).to be_valid
  end

  it 'is valid when only range is present' do
    car_detail.fuel_economy = nil
    car_detail.range = '300 miles'
    expect(car_detail).to be_valid
  end

  it 'belongs to a car' do
    expect(car_detail).to respond_to(:car)
  end

  it 'belongs to an engine_type' do
    expect(car_detail).to respond_to(:engine_type)
  end
end
