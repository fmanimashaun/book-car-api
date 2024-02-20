require 'swagger_helper'

RSpec.describe 'api/cities', type: :request do
  path '/api/v1/cities' do

    post 'Creates a city' do
      tags 'create'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :city, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
        }
      }

      response '201', 'city created' do
        schema type: :object,
          properties: {
            status: {
              type: :object,
              properties: {
                code: { type: :integer },
                message: { type: :string }
              }
            },
            data: {
              type: :object,
              properties: {
                id: { type: :integer },
                name: { type: :string },
              }
            }
          }
        run_test!
      end

    end
  end

  path '/api/v1/cities/{id}' do

    get 'Retrieves a city' do
      tags 'Get'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'city found' do
        let(:id) { create(:city).id }

        schema type: :object,
          properties: {
            status: {
              type: :object,
              properties: {
                code: { type: :integer },
                message: { type: :string }
              }
            },
            data: {
              type: :object,
              properties: {
                id: { type: :integer },
                name: { type: :string },
              }
            }
          }

        run_test!
      end

      response '404', 'city not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Updates a city' do
      tags 'update'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :city, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        }
      }
      parameter name: :id, in: :path, type: :string

      let(:id) { create(:city).id }

      response '200', 'city updated' do
        schema type: :object,
          properties: {
            status: {
              type: :object,
              properties: {
                code: { type: :integer },
                message: { type: :string }
              }
            },
            data: {
              type: :object,
              properties: {
                id: { type: :integer },
                name: { type: :string },
              }
            }
          }

        run_test!
      end
    end

    delete 'Deletes a city' do
      tags 'delete'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      let(:id) { create(:car).id }

      response '200', 'city deleted' do
        schema type: :object,
          properties: {
            status: {
              type: :object,
              properties: {
                code: { type: :integer },
                message: { type: :string }
              }
            },
          }

        run_test!
      end
    end

  end
end
