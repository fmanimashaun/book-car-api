require 'rails_helper'

RSpec.describe API::V1::InitialDataController, type: :controller do
  describe 'GET #index' do
    it 'returns initial data' do
      # Create sample records using factories
      city1 = create(:city, name: 'City 1')
      city2 = create(:city, name: 'City 2')
      engine_type1 = create(:engine_type, name: 'Engine Type 1')
      engine_type2 = create(:engine_type, name: 'Engine Type 2')
      car1 = create(:car, name: 'Car 1')
      car2 = create(:car, name: 'Car 2')

      # Stubbing model methods to return created records
      allow(City).to receive(:all).and_return([city1, city2])
      allow(EngineType).to receive(:all).and_return([engine_type1, engine_type2])
      allow(Car).to receive(:all).and_return([car1, car2])

      get :index

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to include('application/json')

      json_response = JSON.parse(response.body)

      # Check the structure of the JSON response
      expect(json_response['status']['code']).to eq(200)
      expect(json_response['status']['message']).to eq('Initial data fetched.')
      expect(json_response['data']['cities']).to contain_exactly(
        { 'id' => city1.id, 'name' => 'City 1' },
        { 'id' => city2.id, 'name' => 'City 2' }
      )
      expect(json_response['data']['engine_types']).to contain_exactly(
        { 'id' => engine_type1.id, 'name' => 'Engine Type 1' },
        { 'id' => engine_type2.id, 'name' => 'Engine Type 2' }
      )
      expect(json_response['data']['cars'].map { |car| car['name'] }).to contain_exactly('Car 1', 'Car 2')
    end
  end
end
