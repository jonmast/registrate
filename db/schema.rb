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

ActiveRecord::Schema.define(version: 20150930152639) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animals", force: :cascade do |t|
    t.integer  "breeder_id"
    t.integer  "owner_id"
    t.integer  "sire_id"
    t.integer  "dam_id"
    t.date     "birth_date",              null: false
    t.string   "gender",                  null: false
    t.integer  "birth_type",              null: false
    t.boolean  "artificial_insemination", null: false
    t.string   "embryo_transfer",         null: false
    t.integer  "percentage",              null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "registration_type"
    t.integer  "breed",                   null: false
  end

  add_index "animals", ["breeder_id"], name: "index_animals_on_breeder_id", using: :btree
  add_index "animals", ["dam_id"], name: "index_animals_on_dam_id", using: :btree
  add_index "animals", ["owner_id"], name: "index_animals_on_owner_id", using: :btree
  add_index "animals", ["sire_id"], name: "index_animals_on_sire_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "flock_name"
    t.string   "email",                  default: "", null: false
    t.string   "phone"
    t.string   "fax"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
