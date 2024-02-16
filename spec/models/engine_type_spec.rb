require 'rails_helper'

RSpec.describe EngineType, type: :model do
  let(:engine_type) { FactoryBot.create(:engine_type) }

  it "is valid with a name" do
    expect(engine_type.name).to eq('MyString')
    expect(engine_type).to be_valid
  end

  it "is invalid without a name" do
    engine_type = FactoryBot.build(:engine_type, name: nil)

    expect(engine_type.name).to eq(nil)
    expect(engine_type).to_not be_valid
  end

  it "has can have many car details" do
    engine_type = FactoryBot.create(:engine_type)
    car = FactoryBot.create(:car)
    car_detail1 = FactoryBot.create(:car_detail, car: car, engine_type: engine_type)
    car_detail2 = FactoryBot.create(:car_detail, car: car, engine_type: engine_type)

    expect(engine_type.car_details).to include(car_detail1, car_detail2)
  end
end
