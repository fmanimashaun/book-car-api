FactoryBot.define do
  factory :car_detail do
    car { nil }
    engine_type { nil }
    horsepower { 1 }
    torque { 1 }
    fuel_economy { "MyString" }
    seating_capacity { 1 }
    cargo_space { "MyString" }
    infotainment_system { "MyString" }
    safety_rating { "MyString" }
    tech_features { "MyString" }
    special_features { "MyString" }
  end
end
