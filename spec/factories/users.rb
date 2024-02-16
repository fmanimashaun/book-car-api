FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "username#{n}" }
    name { 'John Doe' }
    email { 'john@example.com' }
    password { 'Password123' }
    role { :user }

    trait :admin do
      role { :admin }
    end
  end
end
