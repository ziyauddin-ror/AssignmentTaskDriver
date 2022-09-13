class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.float :amount
      t.string :payment_type
      t.boolean :is_paid, default: false
      t.references :transactiontable, polymorphic: true, null: false
      t.references :driver, null: false, foreign_key: true

      t.timestamps
    end
  end
end
