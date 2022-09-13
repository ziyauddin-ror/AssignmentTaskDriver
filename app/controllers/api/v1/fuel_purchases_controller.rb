class Api::V1::FuelPurchasesController < ApplicationController
	skip_before_action :verify_authenticity_token
	def create_purchase_fuel	
	driver = Driver.find(params[:driver_id])
  purchase = driver.purchase_fuels.new( amount: params[:amount], payment_type: params[:payment_type])
    if purchase.save
    	transaction = purchase.transactions.create(amount: purchase.amount, payment_type: purchase.payment_type, driver_id: driver.id )
    	transaction.update(is_paid:true) if (transaction.payment_type == "card_type" || transaction.payment_type == "bank_account") 
    	PayLaterService.new(driver_id: driver.id).pay_later_trans  	
    end
    render json: purchase, status: :ok
	end
end
