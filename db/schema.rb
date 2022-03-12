# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_03_12_194222) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "school_classes", force: :cascade do |t|
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_school_classes_on_code", unique: true
  end

  create_table "school_classes_teachers", id: false, force: :cascade do |t|
    t.bigint "school_class_id", null: false
    t.bigint "teacher_id", null: false
    t.index ["school_class_id", "teacher_id"], name: "index_school_classes_teachers_on_school_class_id_and_teacher_id"
    t.index ["teacher_id", "school_class_id"], name: "index_school_classes_teachers_on_teacher_id_and_school_class_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "registration"
    t.boolean "active", default: true, null: false
    t.bigint "school_class_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.index ["school_class_id"], name: "index_students_on_school_class_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "expertise"
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "students", "school_classes"
end
