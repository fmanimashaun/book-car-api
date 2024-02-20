require 'rails_helper'
require 'pry'

RSpec.describe API::V1::CitiesController, type: :controller do
  let(:user) { create(:user, :admin) }
  let(:city) { create(:city) }
  let(:valid_attributes) { { name: 'New City' } }
  let(:invalid_attributes) { { name: '' } }

  before do
    sign_in user
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: city.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new city' do
        expect do
          post :create, params: { city: valid_attributes }
        end.to change(City, :count).by(1)
      end

      it 'renders a JSON response with the new city' do
        post :create, params: { city: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to include('application/json')
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new city' do
        expect do
          post :create, params: { city: invalid_attributes }
        end.not_to change(City, :count)
      end

      it 'renders a JSON response with errors for the new city' do
        post :create, params: { city: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid parameters' do
      let(:new_attributes) { { name: 'Updated City' } }

      it 'updates the requested city' do
        put :update, params: { id: city.id, city: new_attributes }
        city.reload
        expect(city.name).to eq('Updated City')
      end

      it 'renders a JSON response with the updated city' do
        put :update, params: { id: city.id, city: new_attributes }
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to include('application/json')
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the city' do
        put :update, params: { id: city.id, city: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested city' do
      city = City.create! valid_attributes
      expect do
        delete :destroy, params: { id: city.id }
      end.to change(City, :count).by(-1)
    end
  end
end
