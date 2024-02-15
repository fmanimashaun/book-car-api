class CarDetailSerializer
  include JSONAPI::Serializer
  attributes :horsepower, :torque, :fuel_economy, :seating_capacity, :cargo_space, :infotainment_system, :safety_rating, :tech_features, :special_features
end
