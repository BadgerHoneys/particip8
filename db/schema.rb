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

ActiveRecord::Schema.define(version: 20151106014912) do

  create_table "attendances", force: :cascade do |t|
    t.integer  "current_day_id", limit: 4
    t.integer  "user_id",        limit: 4
    t.boolean  "is_there",       limit: 1
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "attendances", ["current_day_id"], name: "index_attendances_on_current_day_id", using: :btree
  add_index "attendances", ["user_id"], name: "index_attendances_on_user_id", using: :btree

  create_table "class_managers", force: :cascade do |t|
    t.integer  "school_class_id", limit: 4
    t.integer  "user_id",         limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "class_managers", ["school_class_id"], name: "index_class_managers_on_school_class_id", using: :btree
  add_index "class_managers", ["user_id"], name: "index_class_managers_on_user_id", using: :btree

  create_table "current_days", force: :cascade do |t|
    t.date     "day"
    t.integer  "school_class_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "current_days", ["school_class_id"], name: "index_current_days_on_school_class_id", using: :btree

  create_table "districts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "evaluation_templates", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.integer  "school_class_id", limit: 4
    t.integer  "rating_type_id",  limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "evaluation_templates", ["rating_type_id"], name: "index_evaluation_templates_on_rating_type_id", using: :btree
  add_index "evaluation_templates", ["school_class_id"], name: "index_evaluation_templates_on_school_class_id", using: :btree

  create_table "evaluations", force: :cascade do |t|
    t.integer  "evaluation_template_id", limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "evaluations", ["evaluation_template_id"], name: "index_evaluations_on_evaluation_template_id", using: :btree

  create_table "rating_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "scale",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "evaluation_id", limit: 4
    t.string   "rating_value",  limit: 255
    t.integer  "user_id",       limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "ratings", ["evaluation_id"], name: "index_ratings_on_evaluation_id", using: :btree
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "school_classes", force: :cascade do |t|
    t.integer  "school_id",  limit: 4
    t.integer  "user_id",    limit: 4
    t.string   "name",       limit: 255
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "school_classes", ["school_id"], name: "index_school_classes_on_school_id", using: :btree
  add_index "school_classes", ["user_id"], name: "index_school_classes_on_user_id", using: :btree

  create_table "schools", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "district_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "schools", ["district_id"], name: "index_schools_on_district_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "type",       limit: 255
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.string   "email",      limit: 255
    t.string   "password",   limit: 255
    t.integer  "school_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "salt",       limit: 255
  end

  add_index "users", ["school_id"], name: "index_users_on_school_id", using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "role_id", limit: 4
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  add_foreign_key "attendances", "current_days"
  add_foreign_key "attendances", "users"
  add_foreign_key "class_managers", "school_classes"
  add_foreign_key "class_managers", "users"
  add_foreign_key "current_days", "school_classes"
  add_foreign_key "evaluation_templates", "rating_types"
  add_foreign_key "evaluation_templates", "school_classes"
  add_foreign_key "evaluations", "evaluation_templates"
  add_foreign_key "ratings", "evaluations"
  add_foreign_key "ratings", "users"
  add_foreign_key "school_classes", "schools"
  add_foreign_key "schools", "districts"
end
