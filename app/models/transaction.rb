class Transaction < ApplicationRecord
  belongs_to :driver
  belongs_to :transactiontable, polymorphic: true
  scope :is_paid_payments, -> { where payment_type: 'paylater', is_paid: false }
end
