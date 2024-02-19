require 'rails_helper'

RSpec.describe API::V1::ReservationsController, type: :controller do
  let(:user) { create(:user) }
  let(:city) { create(:city) }
  let(:car) { create(:car) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns reservations of the current user' do
      reservation1 = create(:reservation, user: user)
      reservation2 = create(:reservation, user: user)

      get :index

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to include('application/json')

      json_response = JSON.parse(response.body)
      expect(json_response['status']['code']).to eq(200)
      expect(json_response['status']['message']).to eq('Reservations fetched successfully.')
      expect(json_response['data'].count).to eq(2)
    end
  end

  describe 'GET #show' do
    it 'returns a single reservation' do
      reservation = create(:reservation, user: user)

      get :show, params: { id: reservation.id }

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to include('application/json')

      json_response = JSON.parse(response.body)
      expect(json_response['status']['code']).to eq(200)
      expect(json_response['status']['message']).to eq('Reservation fetched successfully.')
    end
  end

  describe 'POST #create' do
    it 'creates a new reservation' do
      reservation_params = { reservation: { date: Date.today, city_id: city.id, car_id: car.id, user_id: user.id } }

      expect {
        post :create, params: reservation_params
      }.to change(Reservation, :count).by(1)

      expect(response).to have_http_status(:created)
      expect(response.content_type).to include('application/json')

      json_response = JSON.parse(response.body)
      expect(json_response['status']['code']).to eq(201)
      expect(json_response['status']['message']).to eq('Reservation created successfully.')
    end
  end

  describe 'PATCH #update' do
    it 'updates an existing reservation' do
      reservation = create(:reservation, user: user)
      new_date = Date.tomorrow

      patch :update, params: { id: reservation.id, reservation: { date: new_date } }

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to include('application/json')

      json_response = JSON.parse(response.body)
      expect(json_response['status']['code']).to eq(200)
      expect(json_response['status']['message']).to eq('Reservation updated successfully.')
      expect(json_response['data']['date']).to eq(new_date.to_s)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes an existing reservation' do
      reservation = create(:reservation, user: user)

      expect {
        delete :destroy, params: { id: reservation.id }
      }.to change(Reservation, :count).by(-1)

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to include('application/json')

      json_response = JSON.parse(response.body)
      expect(json_response['status']['code']).to eq(200)
      expect(json_response['status']['message']).to eq('Reservation deleted successfully.')
    end
  end
end
