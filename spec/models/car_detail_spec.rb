require 'rails_helper'

RSpec.describe CarDetail, type: :model do
  let(:car) { FactoryBot.create(:car) }
  let(:engine_type) { FactoryBot.create(:engine_type) }

  let(:car_detail) { FactoryBot.create(:car_detail, car: car, engine_type: engine_type) }

  it "Creates a reservation with valid attributes" do
    expect(car_detail).to be_valid
  end

  it "is invalid withinvalid attributes" do
    car_detail = FactoryBot.build(
      :car_detail,
      horsepower: nil,
      car: nil,
      torque: nil,
      fuel_economy: nil,
      seating_capacity: nil,
      seating_capacity: nil,
      cargo_space: nil,
      infotainment_system: nil,
      safety_rating: nil,
      tech_features: nil,
      special_features: nil
    )

    expect(car_detail).to_not be_valid
  end
end
