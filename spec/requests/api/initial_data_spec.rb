require 'swagger_helper'

RSpec.describe 'api/initial_data', type: :request do
  path '/api/v1/initial_data' do
    get 'Retrieves initial data' do
      tags 'Get'
      produces 'application/json'

      response '200', 'initial data found' do
        let(:car) { create(:car) }
        let(:city) { create(:city) }
        let(:engine_type) { create(:engine_type) }

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
                     cars: {
                       type: :array,
                       properties: {
                         id: { type: :string },
                         name: { type: :string },
                         description: { type: :string },
                         image_url: { type: :string }
                       }
                     },
                     cities: {
                       type: :array,
                       properties: {
                         id: { type: :string },
                         name: { type: :string }
                       }
                     },
                     engine_types: {
                       type: :array,
                       properties: {
                         id: { type: :string },
                         name: { type: :string }
                       }
                     }
                   }
                 }
               }

        run_test!
      end
    end
  end
end
