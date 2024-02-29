class ReservationSerializer
  include JSONAPI::Serializer
  attributes :id, :date, :user_id

  attribute :user do |reservation|
    {
      id: reservation.user.id,
      name: reservation.user.name
    }
  end

  attribute :city do |reservation|
    {
      id: reservation.city.id,
      name: reservation.city.name
    }
  end

  attribute :car do |reservation|
    {
      id: reservation.car.id,
      name: reservation.car.name,
      description: reservation.car.description,
      image_url: reservation.car.image_url
    }
  end
end
