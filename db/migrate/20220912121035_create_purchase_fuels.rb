class CreatePurchaseFuels < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_fuels do |t|
      t.float :amount
      t.integer :payment_type
      t.references :driver, null: false, foreign_key: true

      t.timestamps
    end
  end
end
