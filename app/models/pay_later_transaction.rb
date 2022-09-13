class PayLaterTransaction < ApplicationRecord
  belongs_to :driver
  belongs_to :pay_later_wallet
end
