class API::V1::CarsController < ApplicationController
  before_action :authenticate_user!, only: %i[create update destroy]
  before_action :set_car, only: %i[show update destroy]
  load_and_authorize_resource

  # GET /api/v1/cars/:id
  def show
    render json: {
      status: {
        code: 200,
        message: 'Car fetched successfully.'
      },
      data: CarWithDetailsSerializer.new(@car).serializable_hash[:data][:attributes]
    }, status: :ok
  end

  # POST /api/v1/cars
  def create
    @car = Car.new(car_params)

    if @car.save
      @car.set_image_url
      @car.save
      render json: {
               status: {
                 code: 201,
                 message: 'Car created successfully.'
               },
               data: CarWithDetailsSerializer.new(@car).serializable_hash[:data][:attributes]
             },
             status: :created
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/cars/:id
  def update
    if @car.update(car_params)
      @car.set_image_url
      @car.save
      render json: {
               status: {
                 code: 200,
                 message: 'Car updated successfully.'
               },
               data: CarWithDetailsSerializer.new(@car).serializable_hash[:data][:attributes]
             },
             status: :ok
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/cars/:id
  def destroy
    @car.destroy
    render json: {
             status: {
               code: 200,
               message: 'Car deleted successfully.'
             }
           },
           status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_car
    @car = Car.includes(:car_detail).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def car_params
    params.require(:car).permit(
      :name,
      :description,
      :car_image,
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
