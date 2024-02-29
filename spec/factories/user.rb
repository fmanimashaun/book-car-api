require 'faker'

FactoryBot.define do
  factory :user do
    username { Faker::Internet.username(specifier: 5..8) }
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'Password1' }
    password_confirmation { 'Password1' }
    role { :user }
    created_at { Time.zone.now }
    updated_at { Time.zone.now }

    trait :admin do
      role { :admin }
    end
  end
end
