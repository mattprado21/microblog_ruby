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

ActiveRecord::Schema.define(version: 2021_05_17_093021) do

  create_table "friends", charset: "latin1", force: :cascade do |t|
    t.integer "followed_user_id"
    t.integer "following_user_id"
    t.string "status"
    t.integer "updated_by_user_id"
    t.datetime "created"
    t.datetime "modified"
    t.boolean "deleted"
  end

  create_table "post_comments", charset: "latin1", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.string "comment"
    t.datetime "created"
    t.datetime "modified"
    t.boolean "deleted"
  end

  create_table "post_images", charset: "latin1", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.string "image"
    t.datetime "created"
    t.datetime "modified"
    t.boolean "deleted"
  end

  create_table "post_reactions", charset: "latin1", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.integer "comment_id"
    t.datetime "created"
  end

  create_table "posts", charset: "latin1", force: :cascade do |t|
    t.integer "user_id"
    t.string "content"
    t.integer "post_id"
    t.integer "author_id"
    t.string "shared_content"
    t.datetime "shared_created"
    t.datetime "created"
    t.datetime "modified"
    t.boolean "deleted"
  end

  create_table "users", charset: "latin1", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.date "birthdate"
    t.string "bio"
    t.string "profile_image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
