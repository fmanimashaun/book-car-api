class ReservationSerializer
  include JSONAPI::Serializer
  attributes :id, :date
end
