require 'faker'

FactoryBot.define do
  factory :reservation do
    date { Faker::Date.forward(days: 30) }
    city
    car
    user
  end
end
