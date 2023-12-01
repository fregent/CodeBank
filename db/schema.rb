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

ActiveRecord::Schema[7.1].define(version: 2023_12_01_122545) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "likes"
    t.bigint "user_id", null: false
    t.bigint "snippet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["snippet_id"], name: "index_comments_on_snippet_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "directories", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "private", default: true
    t.integer "shared_count", default: 0
    t.datetime "last_viewed"
    t.index ["user_id"], name: "index_directories_on_user_id"
  end

  create_table "directory_snippets", force: :cascade do |t|
    t.bigint "directory_id", null: false
    t.bigint "snippet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["directory_id"], name: "index_directory_snippets_on_directory_id"
    t.index ["snippet_id"], name: "index_directory_snippets_on_snippet_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable"
  end

  create_table "snippets", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.boolean "private"
    t.string "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.text "description"
    t.integer "likes", default: 0
    t.integer "views", default: 0
    t.integer "comments_count", default: 0
    t.integer "shares_count", default: 0
    t.datetime "last_viewed"
    t.index ["user_id"], name: "index_snippets_on_user_id"
  end

  create_table "team_members", force: :cascade do |t|
    t.boolean "admin"
    t.bigint "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_team_members_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "members_count"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "snippets"
  add_foreign_key "comments", "users"
  add_foreign_key "directories", "users"
  add_foreign_key "directory_snippets", "directories"
  add_foreign_key "directory_snippets", "snippets"
  add_foreign_key "snippets", "users"
  add_foreign_key "team_members", "teams"
  add_foreign_key "teams", "users"
end
