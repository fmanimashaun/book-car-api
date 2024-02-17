class CarWithDetailsSerializer
  include JSONAPI::Serializer

  attributes :id, :name, :description

  attribute :car_detail do |car|
    CarDetailSerializer.new(car.car_detail).serializable_hash[:data]
  end
end
