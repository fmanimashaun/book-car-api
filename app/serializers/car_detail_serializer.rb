class CarDetailSerializer
  include JSONAPI::Serializer
  attributes :id,
             :car_id,
             :engine_type_id,
             :horsepower,
             :torque,
             :fuel_economy,
             :range,
             :seating_capacity,
             :cargo_space,
             :infotainment_system,
             :safety_rating,
             :tech_features,
             :special_features
end
