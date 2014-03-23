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

ActiveRecord::Schema.define(version: 20140321001149) do

  create_table "ideas", force: true do |t|
    t.text     "body",       null: false
    t.integer  "trade_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ideas", ["trade_id"], name: "index_ideas_on_trade_id"

  create_table "shops", force: true do |t|
    t.string   "name",                      null: false
    t.string   "phone"
    t.integer  "lower_price"
    t.integer  "higher_price"
    t.integer  "rating"
    t.string   "material_type"
    t.text     "notes"
    t.integer  "workers_count", default: 0
    t.integer  "trade_id",                  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shops", ["trade_id"], name: "index_shops_on_trade_id"

  create_table "trades", force: true do |t|
    t.string   "name",                      null: false
    t.text     "description"
    t.integer  "ideas_count",   default: 0
    t.integer  "shops_count",   default: 0
    t.integer  "workers_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workers", force: true do |t|
    t.string   "name",         null: false
    t.string   "phone"
    t.integer  "lower_price"
    t.integer  "higher_price"
    t.integer  "rating"
    t.text     "notes"
    t.integer  "shop_id",      null: false
    t.integer  "trade_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "workers", ["shop_id"], name: "index_workers_on_shop_id"
  add_index "workers", ["trade_id"], name: "index_workers_on_trade_id"

end
