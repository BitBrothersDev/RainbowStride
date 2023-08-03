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

ActiveRecord::Schema[7.0].define(version: 2023_08_01_192504) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "rainbow_stride_effort_stages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rainbow_stride_exercise_logs", force: :cascade do |t|
    t.bigint "rainbow_stride_workout_id", null: false
    t.bigint "rainbow_stride_exercise_id", null: false
    t.decimal "weight"
    t.integer "repetitions"
    t.integer "rest_time"
    t.integer "exercise_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rainbow_stride_exercise_id"], name: "index_exercise_logs_on_exercise_id"
    t.index ["rainbow_stride_workout_id"], name: "index_exercise_logs_on_workout_id"
  end

  create_table "rainbow_stride_exercise_regimen", force: :cascade do |t|
    t.bigint "exercise_id", null: false
    t.bigint "regimen_blueprint_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_rainbow_stride_exercise_regimen_on_exercise_id"
    t.index ["regimen_blueprint_id"], name: "index_rainbow_stride_exercise_regimen_on_regimen_blueprint_id"
  end

  create_table "rainbow_stride_exercises", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "rainbow_stride_effort_stage_id"
    t.index ["rainbow_stride_effort_stage_id"], name: "index_exercises_on_effort_stage_id"
    t.index ["user_id"], name: "index_rainbow_stride_exercises_on_user_id"
  end

  create_table "rainbow_stride_measurement_types", force: :cascade do |t|
    t.string "name"
    t.string "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rainbow_stride_measurements", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.float "value"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "rainbow_stride_measurement_type_id", null: false
    t.index ["rainbow_stride_measurement_type_id"], name: "index_rs_m_on_rs_mt_id"
    t.index ["user_id"], name: "index_rainbow_stride_measurements_on_user_id"
  end

  create_table "rainbow_stride_rainbow_stride_measurement_types", force: :cascade do |t|
    t.string "name"
    t.string "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rainbow_stride_regimen_blueprints", force: :cascade do |t|
    t.string "title"
    t.datetime "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_rainbow_stride_regimen_blueprints_on_user_id"
  end

  create_table "rainbow_stride_workouts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "rainbow_stride_regimen_blueprint_id", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rainbow_stride_regimen_blueprint_id"], name: "index_workouts_on_regimen_blueprint_id"
    t.index ["user_id"], name: "index_rainbow_stride_workouts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "full_name", default: "", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "rainbow_stride_exercise_logs", "rainbow_stride_exercises"
  add_foreign_key "rainbow_stride_exercise_logs", "rainbow_stride_workouts"
  add_foreign_key "rainbow_stride_exercise_regimen", "rainbow_stride_exercises", column: "exercise_id"
  add_foreign_key "rainbow_stride_exercise_regimen", "rainbow_stride_regimen_blueprints", column: "regimen_blueprint_id"
  add_foreign_key "rainbow_stride_exercises", "rainbow_stride_effort_stages"
  add_foreign_key "rainbow_stride_exercises", "users"
  add_foreign_key "rainbow_stride_measurements", "rainbow_stride_measurement_types"
  add_foreign_key "rainbow_stride_measurements", "users"
  add_foreign_key "rainbow_stride_workouts", "rainbow_stride_regimen_blueprints"
  add_foreign_key "rainbow_stride_workouts", "users"
end
