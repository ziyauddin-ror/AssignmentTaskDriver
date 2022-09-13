class CardDetail < ApplicationRecord
  belongs_to :driver
  validates :card_no, uniqueness: true
  validates :card_no, :expiry_month, :expiry_year, presence: true
  scope :default, -> { where is_default: true }
end
