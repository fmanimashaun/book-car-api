class API::V1::ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reservation, only: %i[show update destroy]
  load_and_authorize_resource

  # GET /api/v1/reservations
  def index
    @reservations = current_user.reservations.includes(:car, :city)

    render json: {
      status: { code: 200, message: 'Reservations fetched successfully.' },
      data: @reservations.map do |reservation|
              ReservationSerializer.new(reservation).serializable_hash[:data][:attributes]
            end
    }, status: :ok
  end

  # GET /api/v1/reservations/:id
  def show
    render json: {
      status: { code: 200, message: 'Reservation fetched successfully.' },
      data: ReservationSerializer.new(@reservation).serializable_hash[:data][:attributes]
    }, status: :ok
  end

  # POST /api/v1/reservations
  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      render json: {
        status: { code: 201, message: 'Reservation created successfully.' },
        data: ReservationSerializer.new(@reservation).serializable_hash[:data][:attributes]
      }, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/reservations/:id
  def update
    if @reservation.update(reservation_params)
      render json: {
        status: { code: 200, message: 'Reservation updated successfully.' },
        data: ReservationSerializer.new(@reservation).serializable_hash[:data][:attributes]
      }, status: :ok
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/reservations/:id
  def destroy
    @reservation.destroy
    render json: {
      status: { code: 200, message: 'Reservation deleted successfully.' }
    }, status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:date, :city_id, :car_id, :user_id)
  end
end
