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

ActiveRecord::Schema.define(version: 20160405162324) do

  create_table "courses", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "slug",        limit: 255
  end

  add_index "courses", ["slug"], name: "index_courses_on_slug", using: :btree

  create_table "domains", force: :cascade do |t|
    t.string   "title",           limit: 255
    t.string   "description",     limit: 255
    t.integer  "course_id",       limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "screening_title", limit: 255
    t.string   "slug",            limit: 255
  end

  add_index "domains", ["course_id"], name: "index_domains_on_course_id", using: :btree
  add_index "domains", ["slug"], name: "index_domains_on_slug", using: :btree

  create_table "game_skills", force: :cascade do |t|
    t.integer  "skill_id",   limit: 4, null: false
    t.integer  "game_id",    limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "games", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.string   "description", limit: 255
    t.integer  "platform",    limit: 4
    t.string   "link",        limit: 255
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "status",      limit: 4,   default: 1
  end

  create_table "skills", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.integer  "grade",       limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "domain_id",   limit: 4
    t.string   "slug",        limit: 255
    t.integer  "course_id",   limit: 4
  end

  add_index "skills", ["course_id"], name: "index_skills_on_course_id", using: :btree
  add_index "skills", ["domain_id"], name: "index_skills_on_domain_id", using: :btree
  add_index "skills", ["slug"], name: "index_skills_on_slug", using: :btree

  create_table "student_skill_states", force: :cascade do |t|
    t.integer  "student_id", limit: 4
    t.integer  "skill_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.boolean  "completed",  limit: 1
    t.boolean  "collected",  limit: 1
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.string   "type",                   limit: 255
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "username",               limit: 255
    t.string   "platform",               limit: 255
    t.string   "gender",                 limit: 255
    t.string   "name_guardian",           limit: 255
    t.string   "country",                limit: 255
    t.date     "birthdate"
    t.string   "best_language",          limit: 255
    t.string   "languages",              limit: 255
    t.string   "study_language",         limit: 255
    t.string   "email_guardian",          limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "skills", "courses"
  add_foreign_key "skills", "domains"
end
