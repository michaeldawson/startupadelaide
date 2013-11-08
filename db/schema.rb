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

ActiveRecord::Schema.define(version: 20131108005850) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "size"
    t.string   "cat_class"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contact_messages", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nodes", force: true do |t|
    t.integer  "category_id"
    t.string   "name"
    t.string   "contact"
    t.string   "street"
    t.string   "city"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "sponsor"
    t.string   "description"
    t.string   "owner"
    t.string   "phone"
    t.string   "champion"
    t.text     "champion_contact"
  end

  create_table "nodes_targets", id: false, force: true do |t|
    t.integer "node_id"
    t.integer "target_id"
  end

  add_index "nodes_targets", ["node_id", "target_id"], name: "index_nodes_targets_on_node_id_and_target_id", unique: true

  create_table "site_configurations", force: true do |t|
    t.string   "key"
    t.text     "value"
    t.string   "form_type"
    t.string   "form_collection_command"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "social_link_prefills", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "social_links", force: true do |t|
    t.string   "link_url"
    t.string   "social_key"
    t.integer  "node_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "targets", force: true do |t|
    t.string   "name"
    t.string   "cat_class"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tweets", force: true do |t|
    t.string   "text"
    t.string   "user_screen_name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "twitter_data", force: true do |t|
    t.string   "key"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
