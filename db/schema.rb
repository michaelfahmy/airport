# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_05_12_032410) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "airlines", force: :cascade do |t|
    t.string "name"
    t.string "currency", default: "EUR"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "airplanes", force: :cascade do |t|
    t.string "model"
    t.integer "business_class_rows"
    t.integer "economy_class_rows"
    t.integer "seats_per_row"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "airline_id"
    t.index ["airline_id"], name: "index_airplanes_on_airline_id"
  end

  create_table "charges", force: :cascade do |t|
    t.bigint "reservation_id"
    t.string "charge_uid"
    t.decimal "amount", precision: 8, scale: 2
    t.string "currency"
    t.string "status"
    t.string "receipt_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_id"], name: "index_charges_on_reservation_id"
  end

  create_table "flights", force: :cascade do |t|
    t.integer "number"
    t.string "departure_airport"
    t.string "destination_airport"
    t.datetime "departure_time"
    t.datetime "arrival_time"
    t.bigint "airplane_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "adult_fee", precision: 8, scale: 2
    t.decimal "child_fee", precision: 8, scale: 2
    t.index ["airplane_id"], name: "index_flights_on_airplane_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.bigint "reservation_id"
    t.string "first_name"
    t.string "last_name"
    t.integer "gender"
    t.integer "passenger_type"
    t.integer "passenger_class"
    t.string "seat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_id"], name: "index_passengers_on_reservation_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "flight_id"
    t.bigint "user_id"
    t.string "confirmation_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_id"], name: "index_reservations_on_flight_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 1
    t.string "first_name"
    t.string "last_name"
    t.string "time_zone", default: "Rome"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role"], name: "index_users_on_role"
  end

end
