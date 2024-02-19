require 'rails_helper'

RSpec.describe API::V1::CitiesController, type: :controller do
  let(:user) { FactoryBot.create(:user, :admin) }
  let(:city) { FactoryBot.create(:city) }

  before do
    sign_in user
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: {id: city.id}

      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
    before { post :create, params: { city: { name: "City Name" } } }

    it 'creates a new city' do
      expect do
        post :create, params: { city: { name: "City Name" } }
      end.to change(City, :count).by(1)
    end

    it 'returns a success message' do
      expect(json['status']['code']).to eq(201)
      expect(json['status']['message']).to eq('City created successfully.')
    end

    it 'returns the city name' do
      expect(json['data']['name']).to eq('City Name')
    end
  end

    context 'when the request is invalid' do
      before { post :create, params: { city: { name: "" } } }

      it 'returns status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns validation errors' do
        expect(json).to have_key('name')
      end
    end
  end

  def json
    JSON.parse(response.body)
  end
end
