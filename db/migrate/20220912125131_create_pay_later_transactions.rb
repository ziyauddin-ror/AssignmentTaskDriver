class CreatePayLaterTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :pay_later_transactions do |t|
      t.integer :pay_later_wallet_id
      t.float :total_amount
      t.string :transaction_ids
      t.references :driver, null: false, foreign_key: true

      t.timestamps
    end
    add_index :pay_later_transactions, :pay_later_wallet_id
  end
end
