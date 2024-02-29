class CarWithDetailsSerializer
  include JSONAPI::Serializer

  attributes :id, :name, :description, :image_url

  attribute :car_detail do |car|
    CarDetailSerializer.new(car.car_detail).serializable_hash[:data][:attributes]
  end
end
