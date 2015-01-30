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

ActiveRecord::Schema.define(version: 20150130011632) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "resource_id",   limit: 255, null: false
    t.string   "resource_type", limit: 255, null: false
    t.integer  "author_id"
    t.string   "author_type",   limit: 255
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace",     limit: 255
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "blog_posts", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.text     "body"
    t.integer  "admin_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "blogger_id"
  end

  add_index "blog_posts", ["admin_user_id"], name: "index_blog_posts_on_admin_user_id"
  add_index "blog_posts", ["blogger_id"], name: "index_blog_posts_on_blogger_id"

  create_table "bloggers", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "oauth_token",            limit: 255
    t.datetime "oauth_expires_at"
  end

  add_index "bloggers", ["email"], name: "index_bloggers_on_email", unique: true
  add_index "bloggers", ["reset_password_token"], name: "index_bloggers_on_reset_password_token", unique: true

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_messages", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nodes", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "name",             limit: 255
    t.string   "contact",          limit: 255
    t.string   "street",           limit: 255
    t.string   "city",             limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sponsor",          limit: 255
    t.text     "description"
    t.string   "owner",            limit: 255
    t.string   "phone",            limit: 255
    t.string   "champion",         limit: 255
    t.string   "champion_contact", limit: 255
  end

  create_table "nodes_targets", id: false, force: :cascade do |t|
    t.integer "node_id"
    t.integer "target_id"
  end

  add_index "nodes_targets", ["node_id", "target_id"], name: "index_nodes_targets_on_node_id_and_target_id", unique: true

  create_table "site_configurations", force: :cascade do |t|
    t.string   "key",                     limit: 255
    t.text     "value"
    t.string   "form_type",               limit: 255
    t.string   "form_collection_command", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "social_link_prefills", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "social_links", force: :cascade do |t|
    t.string   "link_url",   limit: 255
    t.string   "social_key", limit: 255
    t.integer  "node_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "targets", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tweets", force: :cascade do |t|
    t.text     "text"
    t.string   "user_screen_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
