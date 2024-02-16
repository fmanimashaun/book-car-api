class API::V1::CarsController < ApplicationController
  before_action :set_car, only: %i[show]

  def show
    render json: {
      status: {
        code: 200,
        message: 'Car fetched successfully'
      },
      data: CarWithDetailsSerializer.new(@car).serializable_hash[:data][:attributes]
    }, status: :ok
  end

  private

  def set_car
    @car = Car.includes(:car_detail).find(params[:id])
  end

  def car_params
    params.require(:car).permit(
      :name,
      :description,
      car_detail_attributes: %i[
        engine_type_id
        horsepower
        torque
        fuel_economy
        range
        seating_capacity
        cargo_space
        infotainment_system
        safety_rating
        tech_features
        special_features
      ]
    )
  end
end
