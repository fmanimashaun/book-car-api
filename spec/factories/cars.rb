require 'faker'

FactoryBot.define do
  factory :car do
    name { Faker::Vehicle.make_and_model }
    description { Faker::Vehicle.standard_specs.sample }
    after(:build) do |car|
      car.car_image.attach(io: File.open(Rails.root.join('spec', 'support', 'assets', 'test-image.png')),
                           filename: 'test-image.png', content_type: 'image/png')
    end

    after(:create) do |car|
      create(:car_detail, car:)
      car.set_image_url
    end
  end
end
