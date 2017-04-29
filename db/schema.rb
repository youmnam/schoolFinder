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

ActiveRecord::Schema.define(version: 20170422080014) do

  create_table "car_cats", force: :cascade do |t|
    t.string   "Name"
    t.decimal  "Price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "CategoryName"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "category_filters", force: :cascade do |t|
    t.string   "nameOfLabel"
    t.string   "typeOfLabel"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "category_filters", ["category_id"], name: "index_category_filters_on_category_id"

  create_table "item_attachments", force: :cascade do |t|
    t.integer  "item_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_specs", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "category_filter_id"
    t.string   "value"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "item_specs", ["category_filter_id"], name: "index_item_specs_on_category_filter_id"
  add_index "item_specs", ["item_id"], name: "index_item_specs_on_item_id"

  create_table "items", force: :cascade do |t|
    t.string   "item_name"
    t.string   "item_desc"
    t.decimal  "item_price"
    t.string   "item_per"
    t.string   "item_maxp"
    t.string   "item_minp"
    t.integer  "item_status"
    t.integer  "item_available"
    t.string   "item_nviews"
    t.string   "item_nvreqs"
    t.integer  "user_id",        null: false
    t.integer  "category_id",    null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "items", ["category_id"], name: "index_items_on_category_id"
  add_index "items", ["user_id"], name: "index_items_on_user_id"

  create_table "renters", force: :cascade do |t|
    t.string   "renter_name"
    t.string   "renter_email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "renter_id"
    t.date     "from"
    t.date     "to"
    t.string   "name"
    t.string   "email"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reservations", ["item_id"], name: "index_reservations_on_item_id"
  add_index "reservations", ["renter_id"], name: "index_reservations_on_renter_id"

  create_table "users", force: :cascade do |t|
    t.string   "usr_vname"
    t.string   "usr_email"
    t.string   "usr_tel"
    t.string   "usr_address"
    t.string   "usr_gover"
    t.string   "usr_city"
    t.string   "usr_logo"
    t.integer  "usr_delivery"
    t.string   "usr_description"
    t.string   "password_digest"
    t.integer  "categories_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["categories_id"], name: "index_users_on_categories_id"

end
