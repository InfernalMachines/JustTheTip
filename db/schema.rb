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

ActiveRecord::Schema.define(version: 20160421184626) do

  create_table "intdbs", force: :cascade do |t|
    t.string   "country_name"
    t.string   "curr_name"
    t.string   "iso"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "general_service"
    t.decimal  "service_tip_overide"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "usadbs", force: :cascade do |t|
    t.string   "base_country"
    t.string   "base_state_abbr"
    t.string   "base_state"
    t.decimal  "base_tip"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
