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

ActiveRecord::Schema.define(version: 20130218023148) do

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "content_areas", force: true do |t|
    t.string  "name"
    t.boolean "hidden_flag"
  end

  create_table "content_elements", force: true do |t|
    t.string  "name"
    t.string  "url"
    t.integer "provider_id"
    t.boolean "hidden_flag"
    t.integer "format_id"
  end

  create_table "delivery_modes", force: true do |t|
    t.string  "name"
    t.boolean "hidden_flag"
  end

  create_table "formats", force: true do |t|
    t.string  "name"
    t.boolean "hidden_flag"
  end

  create_table "providers", force: true do |t|
    t.string  "name"
    t.integer "content_area_id"
    t.integer "delivery_mode_id"
    t.boolean "hidden_flag"
  end

  create_table "subscribed_tos", force: true do |t|
    t.integer "user_id"
    t.integer "provider_id"
    t.integer "subscription_id"
    t.date    "expiration_date"
  end

  create_table "subscriptions", force: true do |t|
    t.string  "name"
    t.integer "provider_id"
    t.boolean "hidden_flag"
    t.integer "days"
    t.integer "months"
    t.integer "years"
  end

  create_table "users", force: true do |t|
    t.string   "name",                   default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "credit_card_number"
    t.integer  "csc"
    t.boolean  "admin_flag"
    t.boolean  "content_manager_flag"
    t.string   "expiration_date"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

end
