require 'swagger_helper'

RSpec.describe 'api/cars', type: :request do
  let(:user) { create(:user, :admin) }

  before do
    sign_in user
  end

  path '/api/v1/cars' do
    post 'Creates a car' do
      let(:car) do
        {
          name: Faker::Vehicle.make_and_model,
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

      tags 'create'
      consumes 'multipart/form-data'
      produces 'application/json'
      parameter name: :car, in: :formData, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          car_image: { type: :file },
          car_detail_attributes: {
            type: :object,
            properties: {
              engine_type_id: { type: :string },
              horsepower: { type: :string },
              torque: { type: :string },
              fuel_economy: { type: :string },
              range: { type: :string },
              seating_capacity: { type: :string },
              cargo_space: { type: :string },
              infotainment_system: { type: :string },
              safety_rating: { type: :string },
              tech_features: { type: :string },
              special_features: { type: :string }
            }
          }
        }
      }

      response '201', 'car created' do
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
                     description: { type: :string },
                     car_image: { type: :string },
                     car_detail_attributes: {
                       type: :object,
                       properties: {
                         engine_type_id: { type: :string },
                         horsepower: { type: :string },
                         torque: { type: :string },
                         fuel_economy: { type: :string },
                         range: { type: :string },
                         seating_capacity: { type: :string },
                         cargo_space: { type: :string },
                         infotainment_system: { type: :string },
                         safety_rating: { type: :string },
                         tech_features: { type: :string },
                         special_features: { type: :string }
                       }
                     }
                   }
                 }
               }
        run_test!
      end
    end
  end

  path '/api/v1/cars/{id}' do
    get 'Retrieves a car' do
      tags 'Get'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'car found' do
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
                     description: { type: :string },
                     car_image: { type: :string },
                     car_detail_attributes: {
                       type: :object,
                       properties: {
                         engine_type_id: { type: :string },
                         horsepower: { type: :string },
                         torque: { type: :string },
                         fuel_economy: { type: :string },
                         range: { type: :string },
                         seating_capacity: { type: :string },
                         cargo_space: { type: :string },
                         infotainment_system: { type: :string },
                         safety_rating: { type: :string },
                         tech_features: { type: :string },
                         special_features: { type: :string }
                       }
                     }
                   }
                 }
               }

        let(:id) { create(:car).id }
        run_test!
      end

      response '404', 'car not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Updates a car' do
      let(:car) { create(:car) }
      let(:id) { car.id }

      tags 'update'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :car, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          car_image: { type: :string }
        }
      }
      parameter name: :id, in: :path, type: :integer

      response '200', 'car updated' do
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
                     description: { type: :string },
                     car_image: { type: :string },
                     car_detail_attributes: {
                       type: :object,
                       properties: {
                         engine_type_id: { type: :string },
                         horsepower: { type: :string },
                         torque: { type: :string },
                         fuel_economy: { type: :string },
                         range: { type: :string },
                         seating_capacity: { type: :string },
                         cargo_space: { type: :string },
                         infotainment_system: { type: :string },
                         safety_rating: { type: :string },
                         tech_features: { type: :string },
                         special_features: { type: :string }
                       }
                     }
                   }
                 }
               }

        run_test!
      end
    end

    delete 'Deletes a car' do
      tags 'delete'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      let(:id) { create(:car).id }

      response '200', 'car deleted' do
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
