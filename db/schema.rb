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

ActiveRecord::Schema.define(version: 20160726070526) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "line_1"
    t.string   "line_2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "country"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.integer  "dwelling_id"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "phone_number",  limit: 8
    t.string   "email_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["dwelling_id"], name: "index_contacts_on_dwelling_id", using: :btree

  create_table "dwellings", force: :cascade do |t|
    t.string   "dwelling_name"
    t.string   "dwelling_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "floor_plans", force: :cascade do |t|
    t.integer  "dwelling_id"
    t.float    "bedrooms"
    t.float    "baths"
    t.integer  "occupant_min"
    t.integer  "occupant_max"
    t.integer  "mo_rent_min"
    t.integer  "mo_rent_max"
    t.integer  "sq_ft_min"
    t.integer  "sq_ft_max"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "floor_plans", ["dwelling_id"], name: "index_floor_plans_on_dwelling_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "dob"
    t.integer  "last_four"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.string   "user_type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
