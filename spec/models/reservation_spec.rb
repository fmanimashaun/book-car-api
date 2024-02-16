require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let(:city) { FactoryBot.create(:city) }
  let(:car) { FactoryBot.create(:car) }
  let(:user) { FactoryBot.create(:user) }
  let(:reservation) { FactoryBot.create(:reservation, car: car, city: city, user: user) }

  it "Creates a reservation with valid attributes" do
    expect(reservation).to be_valid
  end

  describe "with invalid attributes" do
    it "Doesn't create a reservation with invalid car attribute" do
      reservation = FactoryBot.build(:reservation, car: nil)

      expect(reservation).to_not be_valid
    end

    it "Doesn't create a reservation with invalid city attribute" do
      reservation = FactoryBot.build(:reservation, city: nil)

      expect(reservation).to_not be_valid
    end

    it "Doesn't create a reservation with invalid user attribute" do
      reservation = FactoryBot.build(:reservation, user: nil)

      expect(reservation).to_not be_valid
    end
  end

  describe "associations" do
    it { should belong_to(:city) }
    it { should belong_to(:car) }
    it { should belong_to(:user) }
  end
end
