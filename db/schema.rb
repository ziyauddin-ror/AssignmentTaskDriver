# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_09_12_125131) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_details", force: :cascade do |t|
    t.string "card_no"
    t.string "expiry_month"
    t.string "expiry_year"
    t.boolean "is_default"
    t.bigint "driver_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_card_details_on_driver_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.string "licence_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pay_later_transactions", force: :cascade do |t|
    t.integer "pay_later_wallet_id"
    t.float "total_amount"
    t.string "transaction_ids"
    t.bigint "driver_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_pay_later_transactions_on_driver_id"
    t.index ["pay_later_wallet_id"], name: "index_pay_later_transactions_on_pay_later_wallet_id"
  end

  create_table "pay_later_wallets", force: :cascade do |t|
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchase_fuels", force: :cascade do |t|
    t.float "amount"
    t.integer "payment_type"
    t.bigint "driver_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_purchase_fuels_on_driver_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.float "amount"
    t.string "payment_type"
    t.boolean "is_paid", default: false
    t.string "transactiontable_type", null: false
    t.bigint "transactiontable_id", null: false
    t.bigint "driver_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_transactions_on_driver_id"
    t.index ["transactiontable_type", "transactiontable_id"], name: "index_transactions_on_transactiontable"
  end

  add_foreign_key "card_details", "drivers"
  add_foreign_key "pay_later_transactions", "drivers"
  add_foreign_key "purchase_fuels", "drivers"
  add_foreign_key "transactions", "drivers"
end
