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

ActiveRecord::Schema.define(version: 20161227032531) do

  create_table "applications", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "computers", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "licenses", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "uid",                             null: false
    t.integer  "role",                default: 0, null: false
    t.string   "name"
    t.string   "name_ruby"
    t.string   "name_en"
    t.string   "title"
    t.string   "title_ruby"
    t.string   "title_en"
    t.index ["email"], name: "index_users_on_email"
    t.index ["name"], name: "index_users_on_name"
    t.index ["name_en"], name: "index_users_on_name_en"
    t.index ["name_ruby"], name: "index_users_on_name_ruby"
    t.index ["title"], name: "index_users_on_title"
    t.index ["title_en"], name: "index_users_on_title_en"
    t.index ["title_ruby"], name: "index_users_on_title_ruby"
    t.index ["uid"], name: "index_users_on_uid"
    t.index [nil], name: "index_users_on_role,"
  create_table "yp_garoon_organization_users", id: false, force: :cascade do |t|
    t.integer  "organization_id", null: false
    t.integer  "user_id",         null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["organization_id", "user_id"], name: "index_yp_garoon_organizations_users_on_keys", unique: true
    t.index ["organization_id"], name: "index_yp_garoon_organization_users_on_organization_id"
    t.index ["user_id"], name: "index_yp_garoon_organization_users_on_user_id"
  end

  create_table "yp_garoon_organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "version"
    t.text     "description"
    t.integer  "order"
    t.string   "ancestry"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["ancestry"], name: "index_yp_garoon_organizations_on_ancestry"
    t.index ["description"], name: "index_yp_garoon_organizations_on_description"
    t.index ["name"], name: "index_yp_garoon_organizations_on_name"
    t.index ["order"], name: "index_yp_garoon_organizations_on_order"
    t.index ["version"], name: "index_yp_garoon_organizations_on_version"
  end

  create_table "yp_garoon_users", force: :cascade do |t|
    t.string   "version"
    t.integer  "order"
    t.string   "name"
    t.string   "login_name"
    t.integer  "status",                  default: 0, null: false
    t.string   "reading"
    t.string   "url"
    t.string   "email"
    t.string   "phone"
    t.string   "title"
    t.text     "description"
    t.integer  "primary_organization_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["description"], name: "index_yp_garoon_users_on_description"
    t.index ["email"], name: "index_yp_garoon_users_on_email"
    t.index ["login_name"], name: "index_yp_garoon_users_on_login_name"
    t.index ["name"], name: "index_yp_garoon_users_on_name"
    t.index ["order"], name: "index_yp_garoon_users_on_order"
    t.index ["phone"], name: "index_yp_garoon_users_on_phone"
    t.index ["primary_organization_id"], name: "index_yp_garoon_users_on_primary_organization_id"
    t.index ["reading"], name: "index_yp_garoon_users_on_reading"
    t.index ["status"], name: "index_yp_garoon_users_on_status"
    t.index ["title"], name: "index_yp_garoon_users_on_title"
    t.index ["url"], name: "index_yp_garoon_users_on_url"
    t.index ["version"], name: "index_yp_garoon_users_on_version"
  end

end
