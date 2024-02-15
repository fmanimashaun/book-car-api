class CarSerializer
  include JSONAPI::Serializer
  attributes :name, :description
end
