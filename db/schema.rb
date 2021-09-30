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

ActiveRecord::Schema.define(version: 2021_09_28_174211) do

  create_table "minimum_prices", charset: "utf8", force: :cascade do |t|
    t.string "date"
    t.string "schedule"
    t.string "travel_class"
    t.integer "price"
    t.string "bus_operator"
    t.integer "id_alert_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "price_alerts", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.string "origin"
    t.string "destiny"
    t.string "travelClass"
    t.decimal "price", precision: 10
    t.string "departure_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
