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

ActiveRecord::Schema.define(version: 20141126043201) do

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "links", force: true do |t|
    t.string "url",   limit: 127, null: false
    t.string "title", limit: 127, null: false
  end

  create_table "members", force: true do |t|
    t.string   "email",                             default: "",    null: false
    t.string   "encrypted_password",                default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                   limit: 6
    t.string   "member_name",            limit: 10,                 null: false
    t.string   "brief",                  limit: 64
    t.string   "phone_number",           limit: 11,                 null: false
    t.string   "address",                limit: 64,                 null: false
    t.boolean  "show",                              default: false, null: false
  end

  add_index "members", ["confirmation_token"], name: "index_members_on_confirmation_token", unique: true, using: :btree
  add_index "members", ["email"], name: "index_members_on_email", unique: true, using: :btree
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true, using: :btree

  create_table "msia_infos", force: true do |t|
    t.string "slug",    limit: 10,  null: false
    t.string "name",    limit: 127, null: false
    t.text   "content",             null: false
  end

  add_index "msia_infos", ["slug"], name: "index_msia_infos_on_slug", using: :btree

  create_table "news", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cate",       limit: 1,   null: false
    t.string   "title",      limit: 127, null: false
    t.text     "content",                null: false
  end

end
