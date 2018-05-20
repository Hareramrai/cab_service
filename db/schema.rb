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

ActiveRecord::Schema.define(version: 20180520053337) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cab_models", force: :cascade do |t|
    t.string "name"
    t.string "company"
    t.string "engine"
    t.integer "seats"
    t.string "color"
    t.boolean "air_conditioning"
    t.boolean "marked_as_deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cabs", force: :cascade do |t|
    t.string "plat_number"
    t.boolean "wi_fi"
    t.string "type"
    t.boolean "audio_system"
    t.bigint "cab_model_id"
    t.string "description"
    t.boolean "marked_as_deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cab_model_id"], name: "index_cabs_on_cab_model_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "city"
    t.string "state"
    t.string "country"
    t.integer "number_of_trips"
    t.float "ratings"
    t.datetime "join_on"
    t.boolean "is_online"
    t.float "current_latitude"
    t.float "current_longitude"
    t.float "trip_end_lat"
    t.float "trip_end_long"
    t.bigint "owner_id"
    t.boolean "marked_as_deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_drivers_on_owner_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "address"
    t.string "zip"
    t.string "state"
    t.string "country"
    t.boolean "active"
    t.bigint "vendor_id"
    t.boolean "marked_as_deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vendor_id"], name: "index_owners_on_vendor_id"
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "description"
    t.boolean "marked_as_deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cabs", "cab_models"
  add_foreign_key "drivers", "owners"
  add_foreign_key "owners", "vendors"
end
