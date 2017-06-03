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

ActiveRecord::Schema.define(version: 20170603095259) do

  create_table "conditions", force: :cascade do |t|
    t.integer  "term",         default: 0
    t.integer  "period",       default: 0
    t.integer  "rate",         default: 0
    t.integer  "overdue_rate", default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "entities", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "investments", force: :cascade do |t|
    t.integer  "term",          default: 0
    t.integer  "period",        default: 0
    t.integer  "rate",          default: 0
    t.integer  "overdue_rate",  default: 0
    t.float    "sum",           default: 0.0
    t.float    "interest_paid", default: 0.0
    t.float    "loan_paid",     default: 0.0
    t.integer  "entity_id",                   null: false
    t.integer  "condition_id",                null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["condition_id"], name: "index_investments_on_condition_id"
    t.index ["entity_id"], name: "index_investments_on_entity_id"
  end

  create_table "periods", force: :cascade do |t|
    t.string   "status",        null: false
    t.integer  "investment_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["investment_id"], name: "index_periods_on_investment_id"
  end

end
