# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_06_033443) do

  create_table "bus_routes", force: :cascade do |t|
    t.integer "number"
    t.string "name"
    t.string "customer_type"
    t.string "coverage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bus_stops", force: :cascade do |t|
    t.integer "street_id", null: false
    t.integer "cross_street_id", null: false
    t.integer "number"
    t.string "name"
    t.string "side"
    t.string "direction"
    t.decimal "latitude"
    t.decimal "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cross_street_id"], name: "index_bus_stops_on_cross_street_id"
    t.index ["street_id"], name: "index_bus_stops_on_street_id"
  end

  create_table "streets", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "key"
  end

  create_table "variants", force: :cascade do |t|
    t.string "key"
    t.string "name"
    t.integer "bus_route_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bus_route_id"], name: "index_variants_on_bus_route_id"
  end

  add_foreign_key "bus_stops", "streets"
  add_foreign_key "bus_stops", "streets", column: "cross_street_id"
  add_foreign_key "variants", "bus_routes"
end
