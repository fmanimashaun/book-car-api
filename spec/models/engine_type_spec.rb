require 'rails_helper'

RSpec.describe EngineType, type: :model do
  let(:engine_type) { build(:engine_type) }

  it 'validates presence of name' do
    engine_type.name = nil
    expect(engine_type).not_to be_valid
    expect(engine_type.errors[:name]).to include("can't be blank")
  end

  it 'validates length of name' do
    engine_type.name = 'a' * 256
    expect(engine_type).not_to be_valid
    expect(engine_type.errors[:name]).to include('is too long (maximum is 255 characters)')
  end

  it 'has many car_details' do
    expect(engine_type).to respond_to(:car_details)
  end
end
