require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let(:reservation) { build(:reservation) }

  it 'validates presence of date' do
    reservation.date = nil
    expect(reservation).not_to be_valid
    expect(reservation.errors[:date]).to include("can't be blank")
  end

  it 'validates date cannot be in the past' do
    reservation.date = Date.yesterday
    expect(reservation).not_to be_valid
    expect(reservation.errors[:date]).to include("can't be in the past")
  end

  it 'belongs to a city' do
    expect(reservation).to respond_to(:city)
  end

  it 'belongs to a car' do
    expect(reservation).to respond_to(:car)
  end

  it 'belongs to a user' do
    expect(reservation).to respond_to(:user)
  end
end
