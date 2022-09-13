class CreatePayLaterWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :pay_later_wallets do |t|
      t.float :amount

      t.timestamps
    end
  end
end
