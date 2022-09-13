class PayLaterWallet < ApplicationRecord
	has_many :pay_later_transactions
  validates :amount, presence: true
end
