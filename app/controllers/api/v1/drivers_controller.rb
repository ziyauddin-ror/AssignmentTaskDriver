class Api::V1::DriversController < ApplicationController
	skip_before_action :verify_authenticity_token
  swagger_controller :drivers, 'Drivers'
	def create_driver
		driver = Driver.new(driver_params)

    if driver.save
      data = {driver: driver, message: "Driver is created"}
    else
      data = {message: driver.errors.messages }
    end
    render json: data, status: :ok
	end
	def index
		drivers = Driver.all
    message = drivers.present? ? 'Drivers List' : 'No drivers present'
    data = {
      drivers: drivers,
      message: message
    }
    render json: data, status: :ok
  end

  private
  def driver_params
  	params.require(:driver).permit(:name, :licence_id)
  end
end