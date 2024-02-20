require 'rails_helper'

RSpec.describe API::V1::InitialDataController, type: :controller do
  let!(:city) { create(:city) }
  let!(:car) { create(:car) }

  describe 'GET #index' do
    before do
      get :index
    end

    it 'returns a success response' do
      expect(response).to be_successful
    end

    it 'returns all cities, engine types, and cars' do
      initial_cities_count = City.count
      initial_engine_type_count = EngineType.count
      initial_cars_count = Car.count
      json_response = JSON.parse(response.body)

      expect(json_response['data']['cities'].length).to eq(initial_cities_count)
      expect(json_response['data']['engine_types'].length).to eq(initial_engine_type_count)
      expect(json_response['data']['cars'].length).to eq(initial_cars_count)
    end
  end
end
