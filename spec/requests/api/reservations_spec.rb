require 'swagger_helper'

RSpec.describe 'api/reservations', type: :request do
  let(:user) { create(:user, :admin) }

  before do
    sign_in user
  end

  path '/api/v1/reservations' do
    get 'Retrieves reservations belonging to a user' do
      tags 'Get'
      produces 'application/json'

      response '200', 'reservation found' do
        let(:id) { create(:reservation).id }

        schema type: :object,
               properties: {
                 status: {
                   type: :object,
                   properties: { code: { type: :integer }, message: { type: :string } }
                 },
                 data: { type: :array, properties: [{
                   id: { type: :integer },
                   date: { type: :string }
                 }] }
               }

        run_test!
      end
    end

    post 'Creates a reservation' do
      let(:reservation) { create(:reservation) }

      tags 'create'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          date: { type: :string },
          city_id: { type: :integer },
          car_id: { type: :integer },
          user_id: { type: :integer },
          required: %w[date city_id user_id car_id]
        }
      }

      response '201', 'reservation created' do
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
                     date: { type: :string }
                   }
                 }
               }
        run_test!
      end
    end
  end

  path '/api/v1/reservations/{id}' do
    get 'Retrieves a reservation' do
      tags 'Get'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'reservation found' do
        let(:id) { create(:reservation).id }

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
                     date: { type: :string }
                   }
                 }
               }

        run_test!
      end

      response '404', 'reservation not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Updates a reservation' do
      let(:reservation) { create(:reservation) }
      let(:id) { reservation.id }

      tags 'update'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          date: { type: :string }
        }
      }
      parameter name: :id, in: :path, type: :string

      response '200', 'reservation updated' do
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
                     date: { type: :string }
                   }
                 }
               }

        run_test!
      end
    end

    delete 'Deletes a reservation' do
      tags 'delete'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      let(:id) { create(:reservation).id }

      response '200', 'reservation deleted' do
        schema type: :object,
               properties: {
                 status: {
                   type: :object,
                   properties: {
                     code: { type: :integer },
                     message: { type: :string }
                   }
                 }
               }

        run_test!
      end
    end
  end
end
