FactoryBot.define do
  factory :reservation do
    date { Date.today }
    car { nil }
    user { nil }

    association :city
  end
end
