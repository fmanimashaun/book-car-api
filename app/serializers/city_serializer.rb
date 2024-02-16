class CitySerializer
  include JSONAPI::Serializer
  attributes :id, :name
end
