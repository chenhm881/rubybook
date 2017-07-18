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

ActiveRecord::Schema.define(version: 20150625132841) do

  create_table "articles", force: :cascade do |t|
    t.string   "title",            limit: 255
    t.text     "content",          limit: 65535
    t.string   "reference",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id",      limit: 4,     default: 0, null: false
    t.text     "content_markdown", limit: 65535
    t.integer  "user_id",          limit: 4
    t.string   "user_type",        limit: 255
  end

  add_index "articles", ["user_type", "user_id"], name: "index_articles_on_user_type_and_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "parent_id",   limit: 4,     null: false
    t.text     "description", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["updated_at"], name: "index_categories_on_updated_at", using: :btree

  create_table "relatartitsels", force: :cascade do |t|
    t.integer  "correlation_id", limit: 4
    t.integer  "correlated_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relatartitsels", ["correlated_id"], name: "index_relatartitsels_on_correlated_id", using: :btree
  add_index "relatartitsels", ["correlation_id", "correlated_id"], name: "index_relatartitsels_on_correlation_id_and_correlated_id", unique: true, using: :btree
  add_index "relatartitsels", ["correlation_id"], name: "index_relatartitsels_on_correlation_id", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", limit: 255,   null: false
    t.text     "data",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "tag_articles", force: :cascade do |t|
    t.integer  "tag_id",       limit: 4
    t.integer  "article_id",   limit: 4
    t.integer  "active_count", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",  limit: 255
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
