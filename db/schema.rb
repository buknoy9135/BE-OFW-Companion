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

ActiveRecord::Schema[7.2].define(version: 2025_08_26_104255) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "currency_rates", force: :cascade do |t|
    t.string "base_currency"
    t.string "target_currency"
    t.decimal "rate"
    t.datetime "fetched_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "packages", force: :cascade do |t|
    t.string "tracking_number"
    t.string "courier_name"
    t.string "status"
    t.string "last_location"
    t.datetime "last_update"
    t.datetime "expected_delivery"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "tracking_events", default: [], null: false
    t.string "latest_description"
    t.string "latest_stage"
    t.string "latest_substatus"
    t.jsonb "latest_event_raw"
    t.string "tracking_provider"
    t.string "carrier_code"
    t.index ["user_id", "tracking_number", "courier_name"], name: "index_packages_on_user_tracking_with_courier", unique: true, where: "(courier_name IS NOT NULL)"
    t.index ["user_id", "tracking_number"], name: "index_packages_on_user_tracking_without_courier", unique: true, where: "(courier_name IS NULL)"
    t.index ["user_id"], name: "index_packages_on_user_id"
  end

  create_table "remittance_centers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "place_id"
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_remittance_centers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "contact_number", default: ""
    t.string "current_address", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "time_zone", default: "UTC", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "packages", "users"
  add_foreign_key "remittance_centers", "users"
end
