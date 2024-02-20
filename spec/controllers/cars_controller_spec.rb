require 'rails_helper'
require 'pry'

RSpec.describe API::V1::CarsController, type: :controller do
  let(:user) { FactoryBot.create(:user, :admin) }
  # let(:car) { FactoryBot.create(:car) }
  let(:car_params) do
    {
      name:  Faker::Vehicle.make_and_model,
      description: Faker::Vehicle.standard_specs.sample,
      car_image: fixture_file_upload(Rails.root.join('spec', 'support', 'assets', 'test-image.png'), 'image/png'),
      car_detail_attributes: {
        engine_type_id: FactoryBot.create(:engine_type).id,
        horsepower: 200,
        torque: 180,
        fuel_economy: '25 mpg',
        range: '300 miles',
        seating_capacity: 5,
        cargo_space: '20 cubic feet',
        infotainment_system: 'Test Infotainment System',
        safety_rating: 'Test Safety Rating',
        tech_features: 'Test Tech Features',
        special_features: 'Test Special Features'
      }
    }
  end

  before do
    sign_in user
  end

  describe 'GET #show' do
    it 'returns a success response' do
      car = FactoryBot.create(:car)
      get :show, params: { id: car.id }

      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'creates a new car' do
      car = FactoryBot.create(:car)
      expect {
        post :create, params: { car: car_params }
      }.to change(Car, :count).by(1)



      expect(response).to have_http_status(:created)
    end

    it 'returns JSON response with the created car' do
      post :create, params: { car: car_params }

      expect(response).to have_http_status(:created)
      expect(response.content_type).to include('application/json')

      json_response = JSON.parse(response.body)
      expect(json_response['status']['code']).to eq(201)
      expect(json_response['data']['name']).to eq(car_params[:name])

    end
  end
end
