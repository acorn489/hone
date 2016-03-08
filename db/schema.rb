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

ActiveRecord::Schema.define(version: 20160308085618) do

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

  create_table "games", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.string   "description",        limit: 255
    t.integer  "platform",           limit: 4
    t.string   "link",               limit: 255
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "status",             limit: 4,   default: 1
    t.float    "passing_score",      limit: 24
    t.integer  "primary_skill_id",   limit: 4
    t.integer  "secondary_skill_id", limit: 4
  end

  add_index "games", ["primary_skill_id"], name: "index_games_on_primary_skill_id", using: :btree
  add_index "games", ["secondary_skill_id"], name: "index_games_on_secondary_skill_id", using: :btree

  create_table "levels", force: :cascade do |t|
    t.integer  "value",      limit: 4
    t.integer  "student_id", limit: 4
    t.integer  "course_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "levels", ["course_id"], name: "index_levels_on_course_id", using: :btree
  add_index "levels", ["student_id"], name: "index_levels_on_student_id", using: :btree

  create_table "passes", force: :cascade do |t|
    t.integer  "student_id", limit: 4
    t.integer  "skill_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "passes", ["skill_id"], name: "index_passes_on_skill_id", using: :btree
  add_index "passes", ["student_id", "skill_id"], name: "index_passes_on_student_id_and_skill_id", using: :btree
  add_index "passes", ["student_id"], name: "index_passes_on_student_id", using: :btree

  create_table "scores", force: :cascade do |t|
    t.integer  "correct_answers",     limit: 4
    t.integer  "incorrect_answers",   limit: 4
    t.integer  "student_id",          limit: 4
    t.integer  "game_id",             limit: 4
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.boolean  "best_personal_score", limit: 1,  default: false
    t.boolean  "best_global_score",   limit: 1,  default: false
    t.float    "value_out_ten",       limit: 24
  end

  add_index "scores", ["game_id"], name: "index_scores_on_game_id", using: :btree
  add_index "scores", ["student_id"], name: "index_scores_on_student_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "title",           limit: 255
    t.text     "description",     limit: 65535
    t.integer  "grade",           limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "domain_id",       limit: 4
    t.integer  "level",           limit: 4
    t.integer  "locked_skill_id", limit: 4
    t.integer  "course_id",       limit: 4
    t.string   "slug",            limit: 255
  end

  add_index "skills", ["domain_id"], name: "index_skills_on_domain_id", using: :btree
  add_index "skills", ["locked_skill_id"], name: "index_skills_on_locked_skill_id", using: :btree
  add_index "skills", ["slug"], name: "index_skills_on_slug", using: :btree

  create_table "unlocks", force: :cascade do |t|
    t.integer  "student_id", limit: 4
    t.integer  "game_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "unlocks", ["game_id"], name: "index_unlocks_on_game_id", using: :btree
  add_index "unlocks", ["student_id"], name: "index_unlocks_on_student_id", using: :btree

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "skills", "domains"
end
