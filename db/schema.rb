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

ActiveRecord::Schema.define(version: 20160727221545) do

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

  create_table "amenities", force: :cascade do |t|
    t.string "amenity_name"
  end

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

  create_table "dwelling_details", force: :cascade do |t|
    t.integer "dwelling_id"
    t.string  "key"
    t.string  "value"
  end

  add_index "dwelling_details", ["dwelling_id"], name: "index_dwelling_details_on_dwelling_id", using: :btree

  create_table "dwelling_features", force: :cascade do |t|
    t.integer "amenity_id"
    t.integer "dwelling_id"
    t.boolean "has_amenity?"
  end

  add_index "dwelling_features", ["amenity_id"], name: "index_dwelling_features_on_amenity_id", using: :btree
  add_index "dwelling_features", ["dwelling_id"], name: "index_dwelling_features_on_dwelling_id", using: :btree

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

  create_table "household_members", force: :cascade do |t|
    t.integer "user_id"
    t.string  "first_name"
    t.string  "last_name"
    t.string  "relationship"
    t.date    "dob"
    t.string  "gender"
    t.string  "ethnicity"
  end

  add_index "household_members", ["user_id"], name: "index_household_members_on_user_id", using: :btree

  create_table "income_sources", force: :cascade do |t|
    t.string   "source"
    t.string   "frequency_of_payment"
    t.float    "amount_per_payment"
    t.string   "source_proof_details"
    t.integer  "incomeable_id"
    t.string   "incomeable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "income_sources", ["incomeable_type", "incomeable_id"], name: "index_income_sources_on_incomeable_type_and_incomeable_id", using: :btree

  create_table "ref_address_types", force: :cascade do |t|
    t.string "address_type_code"
    t.string "address_type_description"
  end

  create_table "user_addresses", force: :cascade do |t|
    t.integer "user_id"
    t.integer "address_id"
    t.integer "ref_address_type_id"
  end

  add_index "user_addresses", ["address_id"], name: "index_user_addresses_on_address_id", using: :btree
  add_index "user_addresses", ["ref_address_type_id"], name: "index_user_addresses_on_ref_address_type_id", using: :btree
  add_index "user_addresses", ["user_id"], name: "index_user_addresses_on_user_id", using: :btree

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

  add_foreign_key "user_addresses", "addresses"
  add_foreign_key "user_addresses", "ref_address_types"
  add_foreign_key "user_addresses", "users"
end
