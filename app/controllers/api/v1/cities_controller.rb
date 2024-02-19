class API::V1::CitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_city, only: %i[show update destroy]
  load_and_authorize_resource

  # GET /api/v1/cities/1
  def show
    render json: {
      status: { code: 200, message: 'City fetched successfully.' },
      data: CitySerializer.new(@city).serializable_hash[:data][:attributes]
    }, status: :ok
  end

  # POST /api/v1/cities
  def create
    @city = City.new(city_params)

    if @city.save
      render json: {
        status: { code: 201, message: 'City created successfully.' },
        data: CitySerializer.new(@city).serializable_hash[:data][:attributes]
      }, status: :created
    else
      render json: @city.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/cities/1
  def update
    if @city.update(city_params)
      render json: {
        status: { code: 200, message: 'City updated successfully.' },
        data: CitySerializer.new(@city).serializable_hash[:data][:attributes]
      }, status: :ok
    else
      render json: @city.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/cities/1
  def destroy
    @city.destroy
    render json: {
      status: { code: 200, message: 'City deleted successfully.' }
    }, status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_city
    @city = City.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def city_params
    params.require(:city).permit(:name)
  end
end
