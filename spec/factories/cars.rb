require 'faker'

FactoryBot.define do
  factory :car do
    name { Faker::Vehicle.make_and_model }
    description { Faker::Lorem.paragraph(sentence_count: 3) }

    # Use transient attributes to pass data to associations
    transient do
      car_detail_attributes { {} }
    end

    # Build car_detail association using transient attributes
    after(:build) do |car, evaluator|
      car.car_detail ||= build(:car_detail, car: car, **evaluator.car_detail_attributes)
    end

    # Create car_detail association using transient attributes
    after(:create) do |car, evaluator|
      car.create_car_detail(evaluator.car_detail_attributes.merge(car: car))
      car.set_image_url
    end

    # Attach car image during build
    after(:build) do |car|
      car.car_image.attach(io: File.open(Rails.root.join('spec', 'support', 'assets', 'test-image.png')),
                           filename: 'test-image.png', content_type: 'image/png')
    end
  end
end
