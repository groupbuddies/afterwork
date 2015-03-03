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

ActiveRecord::Schema.define(version: 20150303164450) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendees", force: :cascade do |t|
    t.integer "user_id",  null: false
    t.integer "event_id", null: false
  end

  create_table "availabilities", force: :cascade do |t|
    t.string  "week_day",   null: false
    t.time    "start_time", null: false
    t.time    "end_time",   null: false
    t.integer "user_id",    null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name",        limit: 60, null: false
    t.text     "description"
    t.string   "location",               null: false
    t.datetime "start_date",             null: false
    t.datetime "end_date",               null: false
    t.string   "hashtag",     limit: 60
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 60,              null: false
    t.string   "location"
    t.string   "gender"
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.string   "email"
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
