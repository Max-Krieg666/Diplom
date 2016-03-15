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

ActiveRecord::Schema.define(version: 20151122092440) do

  create_table "disciplines", id: false, force: :cascade do |t|
    t.string   "id",                        null: false
    t.string   "title"
    t.string   "rating_id"
    t.string   "group_id"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "disciplines_users", id: false, force: :cascade do |t|
    t.string "discipline_id"
    t.string "user_id"
  end

  add_index "disciplines_users", ["discipline_id", "user_id"], name: "index_disciplines_users_on_discipline_id_and_user_id"
  add_index "disciplines_users", ["user_id"], name: "index_disciplines_users_on_user_id"

  create_table "documents", id: false, force: :cascade do |t|
    t.string   "id",         null: false
    t.string   "file_name"
    t.string   "file"
    t.string   "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", id: false, force: :cascade do |t|
    t.string   "id",         null: false
    t.string   "numer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", id: false, force: :cascade do |t|
    t.string   "id",            null: false
    t.string   "title"
    t.string   "content"
    t.string   "discipline_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "rating_elements", id: false, force: :cascade do |t|
    t.string   "id",         null: false
    t.string   "title"
    t.integer  "score"
    t.string   "rating_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", id: false, force: :cascade do |t|
    t.string   "id",                          null: false
    t.integer  "max_score",     default: 100
    t.string   "discipline_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "sections", id: false, force: :cascade do |t|
    t.string   "id",         null: false
    t.string   "title"
    t.string   "content"
    t.string   "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_rating_elements", id: false, force: :cascade do |t|
    t.integer  "value",             default: 0
    t.string   "user_id"
    t.string   "rating_element_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "users", id: false, force: :cascade do |t|
    t.string   "id",                             null: false
    t.string   "login"
    t.string   "password_digest"
    t.string   "lastname"
    t.string   "firstname"
    t.string   "patronymic"
    t.string   "email"
    t.integer  "role",            default: 0
    t.string   "group_id"
    t.boolean  "is_active",       default: true
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

end
