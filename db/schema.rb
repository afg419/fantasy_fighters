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

ActiveRecord::Schema.define(version: 20160110012318) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "combatants", force: :cascade do |t|
    t.string   "name"
    t.string   "race"
    t.integer  "strength"
    t.integer  "dexterity"
    t.integer  "intelligence"
    t.integer  "hp"
    t.integer  "matches",      default: 0
    t.integer  "wins",         default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "dojo_id"
  end

  add_index "combatants", ["dojo_id"], name: "index_combatants_on_dojo_id", using: :btree

  create_table "dojos", force: :cascade do |t|
    t.string   "dojo_name"
    t.string   "password_digest"
    t.integer  "wins",            default: 0
    t.integer  "matches",         default: 0
    t.integer  "role",            default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "fights", force: :cascade do |t|
    t.string   "participant_1"
    t.string   "participant_2"
    t.integer  "victor"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_foreign_key "combatants", "dojos"
end
