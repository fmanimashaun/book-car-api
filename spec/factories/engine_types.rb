require 'faker'

FactoryBot.define do
  factory :engine_type do
    name { Faker::Vehicle.engine }
  end
end
