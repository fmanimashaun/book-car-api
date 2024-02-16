require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe Car, type: :model do
  let(:car) { FactoryBot.create(:car) }

  it "is valid with a name" do
    expect(car).to be_valid
  end

  it "is invalid without a name" do
    car = FactoryBot.build(:car, name: nil)

    expect(car).to_not be_valid
  end

  it "is invalid when the name is too short" do
    car = FactoryBot.build(:car, name: "V")

    expect(car).to_not be_valid
  end

  it "is invalid when the name is too long" do
    car = FactoryBot.build(:car, name: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sit amet
    massa vel nulla eleifend semper sed vel est. Phasellus nulla metus, molestie vel condimentum sit amet, commodo sed
    libero. Sed massa tellus, auctor sed varius vitae, egestas nec felis. Curabitur sit amet laoreet turpis, non
    sagittis neque. Proin venenatis ipsum arcu, non aliquam risus blandit eget. Integer sed facilisis nibh.
    Pellentesque eleifend dignissim leo, condimentum interdum metus molestie nec. Phasellus ut enim faucibus,
    facilisis orci in, porttitor ex. Nunc mollis felis odio, sed sollicitudin metus iaculis eget. Nunc cursus, leo
    vitae ultricies commodo, nunc elit porta ligula, in fermentum magna purus et arcu. Vivamus augue eros, elementum
    egestas efficitur vel, feugiat quis mi. Ut sit amet venenatis ligula, id dignissim odio. Duis at magna ultricies,
    vulputate sem non, ullamcorper arcu. Lorem ipsum dolor sit amet, consectetur adipiscing elit.")

    expect(car).to_not be_valid
  end

  it "can have many reservations" do
    engine_type = FactoryBot.create(:engine_type)
    car_detail = FactoryBot.create(:car_detail, engine_type: engine_type, car: car)
    user = FactoryBot.create(:user)
    city = FactoryBot.create(:city)

    reservation1 = FactoryBot.create(:reservation, car: car, city: city, user: user)
    reservation2 = FactoryBot.create(:reservation, car: car, city: city, user: user)

    expect(car.reservations).to include(reservation1, reservation2)
  end

  it "accepts nested attributes for car_detail" do
    should accept_nested_attributes_for(:car_detail)
  end
end
