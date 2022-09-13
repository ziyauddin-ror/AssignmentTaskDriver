class PurchaseFuel < ApplicationRecord
  belongs_to :driver
  has_many :transactions, as: :transactiontable
  enum payment_type: %i[paylater card_type bank_account]
end
