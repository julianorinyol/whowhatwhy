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

ActiveRecord::Schema.define(version: 20150926072549) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activities_hangouts", id: false, force: :cascade do |t|
    t.integer "hangout_id"
    t.integer "activity_id"
  end

  create_table "calendars", force: :cascade do |t|
    t.boolean  "primary"
    t.string   "google_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "summary"
    t.integer  "user_id"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "user_id"
    t.boolean  "from_google"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "summary"
  end

  create_table "hangouts", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "owner_id"
    t.boolean  "all_answered"
  end

  create_table "hangouts_users", id: false, force: :cascade do |t|
    t.integer "hangout_id"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "role"
    t.string   "google_auth_token"
  end

end
