class Api::V1::CardDetailsController < ApplicationController
	skip_before_action :verify_authenticity_token 

	def add_cards
  	driver = Driver.find(params[:driver_id])
  	card = driver.card_details.new(cards_params)
    if card.save
      data = {card: card, message: "Card is created"}
    else
      data = {message: card.errors.messages}
    end
    render json: data, status: :ok
  end

  private
  def cards_params
  	params.require(:card_detail).permit(:card_no, :expiry_month, :expiry_year, :is_default)
  end
end
