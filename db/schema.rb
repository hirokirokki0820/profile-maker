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

ActiveRecord::Schema[7.0].define(version: 2022_09_02_075122) do
  create_table "posts", id: :string, force: :cascade do |t|
    t.string "title"
    t.string "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "question1"
    t.string "question2"
    t.string "question3"
    t.string "question4"
    t.string "question5"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.string "birthday"
    t.string "blood_type"
    t.string "personality"
    t.string "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "answer1"
    t.text "answer2"
    t.text "answer3"
    t.text "answer4"
    t.text "answer5"
    t.text "hobby"
    t.text "speciality"
    t.index ["post_id"], name: "index_profiles_on_post_id"
  end

  create_table "users", id: :string, force: :cascade do |t|
    t.string "account_name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_digest"
  end

  add_foreign_key "posts", "users"
  add_foreign_key "profiles", "posts"
end
