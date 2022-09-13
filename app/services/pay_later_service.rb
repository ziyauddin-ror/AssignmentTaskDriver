class PayLaterService
  def initialize(driver_id)
    @driver_id = driver_id
  end

  def pay_later_trans
    driver = Driver.find(@driver_id[:driver_id])
    card_detail = driver.card_details.default.first
    transactions = driver.transactions.is_paid_payments
    if transactions.present? && card_detail.present?
      transaction_ids = transactions.ids.join(',')
      total_amount = transactions.map(&:amount).sum
      pay_later_wallet = find_pay_later_wallet
      pay_later_wallet = PayLaterWallet.create(amount: total_amount ) if pay_later_wallet.blank?
      pay_later_transactions = driver.pay_later_transactions.update(total_amount: total_amount, transaction_ids: transaction_ids, pay_later_wallet_id: pay_later_wallet.id).first
      pay_later_transactions = driver.pay_later_transactions.create(total_amount: total_amount, transaction_ids: transaction_ids, pay_later_wallet_id: pay_later_wallet.id) if pay_later_transactions.blank?
      update_pay_later_wallet  
    else transactions.blank?
      pay_later_transactions = driver.pay_later_transactions.update(total_amount: 0, transaction_ids: "0").first
      if pay_later_transactions.blank?
        pay_later_wallet = find_pay_later_wallet
        pay_later_wallet = PayLaterWallet.create(amount: 0 ) if pay_later_wallet.blank?
        pay_later_transactions = driver.pay_later_transactions.create(total_amount: 0, transaction_ids: "0", pay_later_wallet_id: pay_later_wallet.id) if pay_later_transactions.blank?
      end
      total_amount = Transaction.is_paid_payments.map(&:amount).sum
      if total_amount.present?
        update_pay_later_wallet
      else
        pay_later_wallet = find_pay_later_wallet
        pay_later_wallet.update(amount: 0)
      end
    end
  end

  def find_pay_later_wallet
    PayLaterWallet.first
  end

  def update_pay_later_wallet
    pay_later_wallet = find_pay_later_wallet
    pay_later_total_amount = pay_later_wallet.pay_later_transactions.map(&:total_amount).sum
    pay_later_wallet.update(amount: pay_later_total_amount)   
  end
end