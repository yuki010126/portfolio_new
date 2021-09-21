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

ActiveRecord::Schema.define(version: 2021_09_21_111228) do

  create_table "admins", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookmarks", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "discussion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_bookmarks_on_customer_id"
    t.index ["discussion_id"], name: "index_bookmarks_on_discussion_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categoryes", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chats", force: :cascade do |t|
    t.string "title"
    t.text "introduction"
    t.integer "customer_id"
    t.string "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.string "nickname"
    t.integer "chat_id"
    t.integer "customer_id"
    t.integer "discussion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "email", null: false
    t.string "phone_number", null: false
    t.text "subject", default: "0", null: false
    t.text "message", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_deleted"
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "discussion_category_relations", force: :cascade do |t|
    t.integer "discussion_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discussions", force: :cascade do |t|
    t.string "title"
    t.text "introduction"
    t.integer "customer_id"
    t.string "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "chat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_favorites_on_chat_id"
    t.index ["customer_id"], name: "index_favorites_on_customer_id"
  end

  create_table "folders", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hashtagposts", force: :cascade do |t|
    t.integer "discussion_id"
    t.integer "hashtag_id_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hashtag_id_id"], name: "index_hashtagposts_on_hashtag_id_id"
  end

  create_table "hashtags", force: :cascade do |t|
    t.string "hashname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hashname"], name: "index_hashtags_on_hashname", unique: true
  end

  create_table "kind_relations", force: :cascade do |t|
    t.integer "kind_id"
    t.integer "chat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kinds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memos", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_memos_on_customer_id"
  end

  create_table "opinions", force: :cascade do |t|
    t.text "content"
    t.string "nickname"
    t.integer "chat_id"
    t.integer "customer_id"
    t.integer "discussion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
