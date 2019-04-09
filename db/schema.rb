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

ActiveRecord::Schema.define(version: 2019_04_08_142138) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hints", force: :cascade do |t|
    t.decimal "longitude"
    t.decimal "latitude"
    t.text "text"
    t.integer "hunt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hunt_id"], name: "index_hints_on_hunt_id"
  end

  create_table "hunts", force: :cascade do |t|
    t.string "name"
    t.datetime "start_date"
    t.datetime "expiry_date"
    t.time "set_time_limit", default: "2000-01-01 00:00:00"
    t.boolean "no_time_limit", default: false
    t.string "winning_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "hints", "hunts"
end
