class ReservationWithDetailsSerializer
  include JSONAPI::Serializer

  attributes :id, :date

  attribute :user do |reservation|
    UserSerializer.new(reservation.user).serializable_hash[:data][:attributes]
  end

  attribute :car do |reservation|
    CarWithDetailsSerializer.new(reservation.car).serializable_hash[:data][:attributes]
  end
end
