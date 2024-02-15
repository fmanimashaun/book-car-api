FactoryBot.define do
  factory :reservation do
    date { "2024-02-15" }
    city { nil }
    car { nil }
    user { nil }
  end
end
