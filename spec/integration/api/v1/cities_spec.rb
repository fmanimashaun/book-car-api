require 'swagger_helper'

RSpec.describe API::V1::CitiesController, type: :request do
  path '/api/v1/cities' do
    get 'Retrieves a list of cities' do
      tags 'Cities'
      response '200', 'Cities successfully found' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string }
                 }
               }

        let!(:cities) { create_list(:city, 3) }
        run_test!
      end
    end

    post 'Creates a new city' do
      tags 'Cities'
      consumes 'application/json'
      parameter name: :city, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }

      response '201', 'City created successfully' do
        let(:city) { { name: 'New York City' } }
        run_test!
      end

      response '422', 'Invalid city parameters' do
        let(:city) { {} } # Missing name
        run_test!
      end
    end
  end

  path '/api/v1/cities/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'ID of city'

    get 'Retrieves a specific city' do
      tags 'Cities'
      response '200', 'City found successfully' do
        let(:city) { create(:city) }
        let(:id) { city.id }
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string }
               }

        run_test!
      end

      response '404', 'City not found' do
        let(:id) { 'invalid_id' }
        run_test!
      end
    end

    # Add blocks for PUT/PATCH and DELETE similarly
  end
end
