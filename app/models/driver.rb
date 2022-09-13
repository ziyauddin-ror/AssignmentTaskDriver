class Driver < ApplicationRecord
	validates :name, :licence_id, presence: true
	validates :licence_id, uniqueness: true
	has_many :card_details
	has_many :transactions
	has_many :purchase_fuels
	has_many :pay_later_transactions
end
