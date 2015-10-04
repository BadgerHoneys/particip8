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

ActiveRecord::Schema.define(version: 20151004210258) do

  create_table "districts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "evaluation_templates", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.integer  "school_class_id",    limit: 4
    t.integer  "rating_type_id",     limit: 4
    t.integer  "evaluation_type_id", limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "evaluation_templates", ["evaluation_type_id"], name: "index_evaluation_templates_on_evaluation_type_id", using: :btree
  add_index "evaluation_templates", ["rating_type_id"], name: "index_evaluation_templates_on_rating_type_id", using: :btree
  add_index "evaluation_templates", ["school_class_id"], name: "index_evaluation_templates_on_school_class_id", using: :btree

  create_table "evaluation_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

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
    t.integer  "student_id",    limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "ratings", ["evaluation_id"], name: "index_ratings_on_evaluation_id", using: :btree
  add_index "ratings", ["student_id"], name: "index_ratings_on_student_id", using: :btree

  create_table "school_classes", force: :cascade do |t|
    t.integer  "school_id",  limit: 4
    t.integer  "teacher_id", limit: 4
    t.string   "name",       limit: 255
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "school_classes", ["school_id"], name: "index_school_classes_on_school_id", using: :btree
  add_index "school_classes", ["teacher_id"], name: "index_school_classes_on_teacher_id", using: :btree

  create_table "schools", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "district_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "schools", ["district_id"], name: "index_schools_on_district_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.integer  "school_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "students", ["school_id"], name: "index_students_on_school_id", using: :btree

  create_table "teachers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.integer  "school_id",  limit: 4
    t.string   "password",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "teachers", ["school_id"], name: "index_teachers_on_school_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "evaluation_templates", "evaluation_types"
  add_foreign_key "evaluation_templates", "rating_types"
  add_foreign_key "evaluation_templates", "school_classes"
  add_foreign_key "evaluations", "evaluation_templates"
  add_foreign_key "ratings", "evaluations"
  add_foreign_key "ratings", "students"
  add_foreign_key "school_classes", "schools"
  add_foreign_key "school_classes", "teachers"
  add_foreign_key "schools", "districts"
  add_foreign_key "students", "schools"
  add_foreign_key "teachers", "schools"
end
