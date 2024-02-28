# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_27_134818) do
  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "working_data", force: :cascade do |t|
    t.datetime "check_in"
    t.datetime "check_out"
    t.integer "working_min"
    t.integer "month"
    t.integer "salary"
    t.boolean "working_now", default: false
    t.integer "user_id", null: false
    t.integer "working_place_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_working_data_on_user_id"
    t.index ["working_place_id"], name: "index_working_data_on_working_place_id"
  end

  create_table "working_places", force: :cascade do |t|
    t.string "place"
    t.integer "wage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place"], name: "index_working_places_on_place", unique: true
  end

  create_table "workingtimes", force: :cascade do |t|
    t.datetime "check_in"
    t.datetime "check_out"
    t.integer "working_min"
    t.integer "month"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "working_now", default: false
    t.integer "working_place_id"
    t.index ["user_id"], name: "index_workingtimes_on_user_id"
  end

  add_foreign_key "working_data", "users"
  add_foreign_key "working_data", "working_places"
  add_foreign_key "workingtimes", "users"
end
