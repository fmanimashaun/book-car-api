class ReservationSerializer
  include JSONAPI::Serializer
  attributes :id, :date, :city, :car, :user
end
