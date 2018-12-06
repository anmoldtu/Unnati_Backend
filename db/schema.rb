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

ActiveRecord::Schema.define(version: 2018_10_08_145051) do

  create_table "admins", force: :cascade do |t|
    t.string "username", null: false
    t.string "password", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attendanceadmins", force: :cascade do |t|
    t.string "user_name"
    t.integer "status"
    t.string "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "area"
    t.integer "user_id"
  end

  create_table "attendanceentres", force: :cascade do |t|
    t.string "user_name"
    t.integer "status"
    t.string "date"
    t.string "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "bios", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "course_id", null: false
    t.string "name", null: false
    t.string "area", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "fees"
    t.datetime "expirytime"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entrebios", force: :cascade do |t|
    t.integer "entre_id", null: false
    t.string "name"
    t.string "area"
    t.integer "money"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entres", force: :cascade do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_entres_on_email", unique: true
    t.index ["reset_password_token"], name: "index_entres_on_reset_password_token", unique: true
  end

  create_table "fields", force: :cascade do |t|
    t.integer "num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mods", force: :cascade do |t|
    t.string "name"
    t.string "video"
    t.integer "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "document_file_name"
    t.string "document_content_type"
    t.bigint "document_file_size"
    t.datetime "document_updated_at"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "mod_id", null: false
    t.string "answer"
    t.string "option1"
    t.string "option2"
    t.string "option3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ques"
    t.string "queshin"
    t.string "option1hin"
    t.string "option2hin"
    t.string "option3hin"
  end

  create_table "reports", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "mod_id", null: false
    t.integer "correctans"
    t.integer "wrongans"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "modname"
  end

  create_table "results", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "mod_id", null: false
    t.string "ans_marked", null: false
    t.integer "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "correct"
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
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
