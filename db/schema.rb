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

ActiveRecord::Schema.define(version: 2018_11_11_115813) do

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.string "image"
    t.string "url"
    t.text "description"
    t.string "slug"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.string "job_type"
    t.string "location"
    t.string "desired_salary"
    t.string "timing"
    t.string "age"
    t.string "skills"
    t.string "capacity"
    t.string "languages"
    t.string "employment_pattern"
    t.text "note"
    t.text "comment"
    t.string "image"
    t.boolean "job_type_chk", default: true
    t.boolean "location_chk", default: true
    t.boolean "desired_salary_chk", default: true
    t.boolean "timing_chk", default: false
    t.boolean "age_chk", default: true
    t.boolean "skills_chk", default: true
    t.boolean "capacity_chk", default: false
    t.boolean "languages_chk", default: false
    t.boolean "employment_pattern_chk", default: false
    t.boolean "note_chk", default: true
    t.boolean "state", default: true
    t.string "slug"
    t.integer "update_count", default: 0
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "bitly_url"
    t.index ["user_id", "created_at"], name: "index_resumes_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_resumes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "nickname"
    t.string "image_url"
    t.string "image"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nickname"], name: "index_users_on_nickname", unique: true
  end

end
