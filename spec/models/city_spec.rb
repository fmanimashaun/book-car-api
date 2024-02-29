require 'rails_helper'

RSpec.describe City, type: :model do
  let(:city) { build(:city) }

  it 'validates presence of name' do
    city.name = nil
    expect(city).not_to be_valid
    expect(city.errors[:name]).to include("can't be blank")
  end

  it 'validates length of name' do
    city.name = 'a' * 256
    expect(city).not_to be_valid
    expect(city.errors[:name]).to include('is too long (maximum is 255 characters)')
  end

  it 'has many reservations' do
    expect(city).to respond_to(:reservations)
  end
end
