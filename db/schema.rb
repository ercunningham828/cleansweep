# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150526132615) do

  create_table "average_caches", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "avg",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "vendor_id"
    t.date     "date"
    t.time     "time"
    t.integer  "cost"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "property_id"
  end

  add_index "bookings", ["customer_id"], name: "index_bookings_on_customer_id"
  add_index "bookings", ["property_id"], name: "index_bookings_on_property_id"
  add_index "bookings", ["vendor_id"], name: "index_bookings_on_vendor_id"

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "overall_averages", force: :cascade do |t|
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "overall_avg",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.integer  "bedrooms"
    t.integer  "bathrooms"
    t.string   "type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "properties", ["user_id"], name: "index_properties_on_user_id"

  create_table "rates", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type"
  add_index "rates", ["rater_id"], name: "index_rates_on_rater_id"

  create_table "rating_caches", force: :cascade do |t|
    t.integer  "cacheable_id"
    t.string   "cacheable_type"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type"

  create_table "reviews", force: :cascade do |t|
    t.integer  "booking_id"
    t.integer  "timeliness_rating"
    t.integer  "professional_rating"
    t.integer  "clean_rating"
    t.integer  "overall_rating"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "comments"
  end

  add_index "reviews", ["booking_id"], name: "index_reviews_on_booking_id"

  create_table "schedules", force: :cascade do |t|
    t.integer  "user_id"
    t.time     "monday_start"
    t.time     "monday_end"
    t.time     "tuesday_start"
    t.time     "tuesday_end"
    t.time     "wednesday_start"
    t.time     "wednesday_end"
    t.time     "thursday_start"
    t.time     "thursday_end"
    t.time     "friday_start"
    t.time     "friday_end"
    t.time     "saturday_start"
    t.time     "saturday_end"
    t.time     "sunday_start"
    t.time     "sunday_end"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "schedules", ["user_id"], name: "index_schedules_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "phone_number"
    t.string   "role"
    t.integer  "base_rate"
    t.integer  "bedroom_rate"
    t.integer  "bathroom_rate"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "zipcode"
    t.float    "rating"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
