class Api::V1::PayLaterController < ApplicationController
	skip_before_action :verify_authenticity_token
	def pay_later_amounts
		pay_later_wallet = PayLaterWallet.first
		render json: pay_later_wallet, status: :ok
	end

	def pay_later_transactions
		driver_paylater_trans = PayLaterTransaction.where(driver_id: params[:driver_id])
		render json: driver_paylater_trans, status: :ok
	end
	def is_paid_transaction
		transaction_ids = params[:transaction_ids].split(',')
		driver = Driver.find(params[:driver_id])
		transactions = driver.transactions.where(id: transaction_ids)
		if transactions.present?
			transactions.update(is_paid: true)
			data = {transactions: transactions, message: "transactions are update"}
    else
      data = { message: "Not Update" }
		end
		PayLaterService.new(driver_id: driver.id).pay_later_trans
		render json: data, status: :ok
	end
end
