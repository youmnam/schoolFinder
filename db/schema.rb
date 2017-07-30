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

ActiveRecord::Schema.define(version: 20170730183028) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "job_vacancies", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "qualifications"
    t.datetime "opened_at"
    t.string "school_name"
    t.string "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", force: :cascade do |t|
    t.string "text"
    t.datetime "date"
    t.bigint "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_news_on_school_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "rate1"
    t.integer "rate2"
    t.integer "rate3"
    t.integer "rate4"
    t.bigint "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "username"
    t.text "email"
    t.text "comment"
    t.index ["school_id"], name: "index_ratings_on_school_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "school_name"
    t.string "school_description"
    t.string "school_city"
    t.string "school_area"
    t.string "school_curriculum"
    t.string "school_certificate"
    t.string "school_eduSystem"
    t.boolean "school_foreignTeachers"
    t.string "school_feesRange"
    t.string "school_availableGrades"
    t.integer "school_age"
    t.string "school_website"
    t.string "school_telephone"
    t.string "school_email"
    t.string "school_app"
    t.string "school_address"
    t.string "admission_status"
    t.string "admission_email"
    t.boolean "school_cafeteria"
    t.boolean "school_soccerPlayground"
    t.boolean "school_InnovationSpaces"
    t.boolean "school_theater"
    t.boolean "school_computerLabs"
    t.boolean "school_scienceLab"
    t.boolean "school_library"
    t.boolean "school_swimmingPool"
    t.string "school_logo"
    t.json "school_images"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: false
  end

  create_table "tutors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.text "phone"
    t.text "description"
    t.string "current_job"
    t.text "qualifications"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ratings", "schools"
end
