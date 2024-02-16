class API::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: [:destroy, :show, :update]

  def index
    @data = Reservation.all
    render json: {
      status: { code: 200, message: 'Reservations retrieved successfully.' },
      reservations: @data.map do |reservation|
        ReservationSerializer.new(reservation).serializable_hash[:data][:attributes]
      end
    }, status: :ok
  end

  def destroy
    @reservation.destroy!
    render json: {
      status: { code: 200, message: "Reservation deleted successfully." },
    }, status: :ok
  end

  def show
    render json: {
      status: { code: 200, message: 'Reservation fetched successfully' },
      data: ReservationSerializer.new(@reservation).serializable_hash[:data][:attributes]
    }
  end

  private
  def set_reservation
    @reservation = Reservation.find params[:id]
  end

  def reservation_params
    params.require(:reservation).permit(:date, :city_id, :car_id, user_id)
  end
end
