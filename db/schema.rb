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

ActiveRecord::Schema.define(version: 20151127103536) do

  create_table "accounts", force: :cascade do |t|
    t.string   "first_name",    limit: 4000
    t.string   "last_name",     limit: 4000
    t.boolean  "active"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "location",      limit: 4000
    t.string   "login",         limit: 4000
    t.float    "debt",                       default: 0.0
    t.boolean  "need_reminder",              default: false
    t.integer  "user_gp",       limit: 4,    default: 2
  end

  create_table "daily_balances", force: :cascade do |t|
    t.date     "date"
    t.float    "cal_balance",              default: 0.0
    t.float    "adjustment",               default: 0.0
    t.string   "remark",      limit: 4000
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "daily_balances", ["date"], name: "index_daily_balances_on_date", unique: true

  create_table "foodTypes", force: :cascade do |t|
    t.string "name", limit: 4000
  end

  create_table "foods", force: :cascade do |t|
    t.integer  "restaurant_id", limit: 4
    t.string   "name",          limit: 4000
    t.string   "name2",         limit: 4000
    t.boolean  "active",                     default: true
    t.float    "price"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.float    "price2"
    t.integer  "foodType_id",   limit: 4
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "account_id", limit: 4
    t.date     "date"
    t.integer  "food_id",    limit: 4
    t.string   "remark",     limit: 4000
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",       limit: 4000
    t.boolean  "active",                  default: true
    t.string   "email",      limit: 4000
    t.string   "address",    limit: 4000
    t.string   "phone1",     limit: 4000
    t.string   "phone2",     limit: 4000
    t.string   "fax",        limit: 4000
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

end
