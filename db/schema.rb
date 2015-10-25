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

ActiveRecord::Schema.define(version: 20151025190451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contracts", force: :cascade do |t|
    t.string   "reference_number"
    t.string   "description"
    t.string   "contract_number"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "state_users"
    t.boolean  "local_agencies"
    t.string   "contact_name"
    t.string   "contact_phone"
    t.string   "contact_email"
    t.string   "url"
    t.boolean  "epp_compliant"
    t.boolean  "sabrc_compliant"
    t.boolean  "sb_dvbe_compliant"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "purch_count"
    t.string   "display_name"
  end

  create_table "purchases", force: :cascade do |t|
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "supplier_code"
    t.string   "commodity_title"
    t.string   "segment"
    t.string   "segment_title"
    t.boolean  "calcard"
    t.decimal  "unit_price"
    t.string   "acquisition_method"
    t.date     "create_date"
    t.date     "purchase_date"
    t.string   "family"
    t.string   "family_title"
    t.integer  "quantity"
    t.string   "acquisition_type"
    t.string   "department_name"
    t.string   "normalized_unspsc"
    t.string   "purchase_order_number"
    t.string   "supplier_name"
    t.string   "class_title"
    t.string   "class_name"
    t.string   "item_description"
    t.string   "item_name"
    t.decimal  "total_price"
    t.string   "fiscal_year"
    t.string   "classification_codes"
    t.string   "contract_number"
    t.boolean  "epp_compliance"
    t.boolean  "sabrc_compliant"
    t.boolean  "epp_compliant"
    t.boolean  "potential_epp"
    t.string   "potential_contract"
  end

  add_index "purchases", ["department_name"], name: "index_purchases_on_department_name", using: :btree

  create_table "unspsc_records", force: :cascade do |t|
    t.string   "level_one"
    t.string   "level_two"
    t.string   "level_three"
    t.string   "level_four"
    t.string   "level_one_description"
    t.string   "level_two_description"
    t.string   "level_three_description"
    t.string   "level_four_description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "full_code"
  end

  add_index "unspsc_records", ["full_code"], name: "index_unspsc_records_on_full_code", using: :btree

  create_table "unspscs", force: :cascade do |t|
    t.string   "number"
    t.string   "description"
    t.integer  "contract_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "unspscs", ["number"], name: "index_unspscs_on_number", using: :btree

end
