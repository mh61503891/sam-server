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

ActiveRecord::Schema.define(version: 20170101000043) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.string   "name"
    t.string   "name_ruby"
    t.string   "name_en"
    t.text     "description"
    t.integer  "supplier_id"
    t.integer  "manufacturer_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["description"], name: "index_applications_on_description", using: :btree
    t.index ["manufacturer_id"], name: "index_applications_on_manufacturer_id", using: :btree
    t.index ["name"], name: "index_applications_on_name", using: :btree
    t.index ["name_en"], name: "index_applications_on_name_en", using: :btree
    t.index ["name_ruby"], name: "index_applications_on_name_ruby", using: :btree
    t.index ["supplier_id"], name: "index_applications_on_supplier_id", using: :btree
  end

  create_table "assignments", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "name_ruby"
    t.string   "name_en"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["description"], name: "index_assignments_on_description", using: :btree
    t.index ["name"], name: "index_assignments_on_name", unique: true, using: :btree
    t.index ["name_en"], name: "index_assignments_on_name_en", using: :btree
    t.index ["name_ruby"], name: "index_assignments_on_name_ruby", using: :btree
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "name_ruby"
    t.string   "name_en"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["description"], name: "index_companies_on_description", using: :btree
    t.index ["name"], name: "index_companies_on_name", using: :btree
    t.index ["name_en"], name: "index_companies_on_name_en", using: :btree
    t.index ["name_ruby"], name: "index_companies_on_name_ruby", using: :btree
  end

  create_table "computers", force: :cascade do |t|
    t.string   "name"
    t.string   "name_ruby"
    t.string   "name_en"
    t.text     "description"
    t.integer  "supplier_id"
    t.integer  "manufacturer_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["description"], name: "index_computers_on_description", using: :btree
    t.index ["manufacturer_id"], name: "index_computers_on_manufacturer_id", using: :btree
    t.index ["name"], name: "index_computers_on_name", using: :btree
    t.index ["name_en"], name: "index_computers_on_name_en", using: :btree
    t.index ["name_ruby"], name: "index_computers_on_name_ruby", using: :btree
    t.index ["supplier_id"], name: "index_computers_on_supplier_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "name_ruby"
    t.string   "name_en"
    t.text     "description"
    t.string   "ancestry"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["ancestry"], name: "index_groups_on_ancestry", using: :btree
    t.index ["description"], name: "index_groups_on_description", using: :btree
    t.index ["name"], name: "index_groups_on_name", using: :btree
    t.index ["name_en"], name: "index_groups_on_name_en", using: :btree
    t.index ["name_ruby"], name: "index_groups_on_name_ruby", using: :btree
  end

  create_table "licenses", force: :cascade do |t|
    t.string   "name"
    t.string   "name_ruby"
    t.string   "name_en"
    t.text     "description"
    t.integer  "supplier_id"
    t.integer  "manufacturer_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["description"], name: "index_licenses_on_description", using: :btree
    t.index ["manufacturer_id"], name: "index_licenses_on_manufacturer_id", using: :btree
    t.index ["name"], name: "index_licenses_on_name", using: :btree
    t.index ["name_en"], name: "index_licenses_on_name_en", using: :btree
    t.index ["name_ruby"], name: "index_licenses_on_name_ruby", using: :btree
    t.index ["supplier_id"], name: "index_licenses_on_supplier_id", using: :btree
  end

  create_table "memberships", id: false, force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "group_id"
    t.integer  "title_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_memberships_on_group_id", using: :btree
    t.index ["person_id", "group_id", "title_id"], name: "index_memberships_on_person_id_and_group_id_and_title_id", unique: true, using: :btree
    t.index ["person_id"], name: "index_memberships_on_person_id", using: :btree
    t.index ["title_id"], name: "index_memberships_on_title_id", using: :btree
  end

  create_table "people", force: :cascade do |t|
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
    t.string   "yp_ldap_uid"
    t.string   "yp_garoon_uid"
    t.string   "name"
    t.string   "name_ruby"
    t.string   "name_en"
    t.text     "description"
    t.index ["description"], name: "index_people_on_description", using: :btree
    t.index ["email"], name: "index_people_on_email", using: :btree
    t.index ["name"], name: "index_people_on_name", using: :btree
    t.index ["name_en"], name: "index_people_on_name_en", using: :btree
    t.index ["name_ruby"], name: "index_people_on_name_ruby", using: :btree
    t.index ["uid"], name: "index_people_on_uid", unique: true, using: :btree
    t.index ["yp_garoon_uid"], name: "index_people_on_yp_garoon_uid", using: :btree
    t.index ["yp_ldap_uid"], name: "index_people_on_yp_ldap_uid", using: :btree
  end

  create_table "person_applications", force: :cascade do |t|
    t.integer  "person_id",      null: false
    t.integer  "application_id", null: false
    t.integer  "assignment_id",  null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["application_id"], name: "index_person_applications_on_application_id", using: :btree
    t.index ["assignment_id"], name: "index_person_applications_on_assignment_id", using: :btree
    t.index ["person_id", "application_id", "assignment_id"], name: "index_person_applications_on_habtm", unique: true, using: :btree
    t.index ["person_id"], name: "index_person_applications_on_person_id", using: :btree
  end

  create_table "person_computers", force: :cascade do |t|
    t.integer  "person_id",     null: false
    t.integer  "computer_id",   null: false
    t.integer  "assignment_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["assignment_id"], name: "index_person_computers_on_assignment_id", using: :btree
    t.index ["computer_id"], name: "index_person_computers_on_computer_id", using: :btree
    t.index ["person_id", "computer_id", "assignment_id"], name: "index_person_computers_on_habtm", unique: true, using: :btree
    t.index ["person_id"], name: "index_person_computers_on_person_id", using: :btree
  end

  create_table "person_licenses", force: :cascade do |t|
    t.integer  "person_id",     null: false
    t.integer  "license_id",    null: false
    t.integer  "assignment_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["assignment_id"], name: "index_person_licenses_on_assignment_id", using: :btree
    t.index ["license_id"], name: "index_person_licenses_on_license_id", using: :btree
    t.index ["person_id", "license_id", "assignment_id"], name: "index_person_licenses_on_habtm", unique: true, using: :btree
    t.index ["person_id"], name: "index_person_licenses_on_person_id", using: :btree
  end

  create_table "titles", force: :cascade do |t|
    t.string   "name"
    t.string   "name_ruby"
    t.string   "name_en"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["description"], name: "index_titles_on_description", using: :btree
    t.index ["name"], name: "index_titles_on_name", using: :btree
    t.index ["name_en"], name: "index_titles_on_name_en", using: :btree
    t.index ["name_ruby"], name: "index_titles_on_name_ruby", using: :btree
  end

  create_table "yp_garoon_groups", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "order"
    t.string   "version"
    t.string   "ancestry"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["ancestry"], name: "index_yp_garoon_groups_on_ancestry", using: :btree
    t.index ["description"], name: "index_yp_garoon_groups_on_description", using: :btree
    t.index ["name"], name: "index_yp_garoon_groups_on_name", using: :btree
    t.index ["order"], name: "index_yp_garoon_groups_on_order", using: :btree
    t.index ["version"], name: "index_yp_garoon_groups_on_version", using: :btree
  end

  create_table "yp_garoon_memberships", id: false, force: :cascade do |t|
    t.integer  "yp_garoon_person_id", null: false
    t.integer  "yp_garoon_group_id",  null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["yp_garoon_group_id"], name: "index_yp_garoon_memberships_on_yp_garoon_group_id", using: :btree
    t.index ["yp_garoon_person_id", "yp_garoon_group_id"], name: "index_yp_garoon_memberships_on_habtm", unique: true, using: :btree
    t.index ["yp_garoon_person_id"], name: "index_yp_garoon_memberships_on_yp_garoon_person_id", using: :btree
  end

  create_table "yp_garoon_people", force: :cascade do |t|
    t.string   "login_name"
    t.string   "name"
    t.string   "reading"
    t.string   "title"
    t.string   "email"
    t.string   "phone"
    t.string   "url"
    t.text     "description"
    t.integer  "primary_group_id"
    t.integer  "order"
    t.integer  "status",           default: 0, null: false
    t.string   "version"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["description"], name: "index_yp_garoon_people_on_description", using: :btree
    t.index ["email"], name: "index_yp_garoon_people_on_email", using: :btree
    t.index ["login_name"], name: "index_yp_garoon_people_on_login_name", unique: true, using: :btree
    t.index ["name"], name: "index_yp_garoon_people_on_name", using: :btree
    t.index ["order"], name: "index_yp_garoon_people_on_order", using: :btree
    t.index ["phone"], name: "index_yp_garoon_people_on_phone", using: :btree
    t.index ["primary_group_id"], name: "index_yp_garoon_people_on_primary_group_id", using: :btree
    t.index ["reading"], name: "index_yp_garoon_people_on_reading", using: :btree
    t.index ["status"], name: "index_yp_garoon_people_on_status", using: :btree
    t.index ["title"], name: "index_yp_garoon_people_on_title", using: :btree
    t.index ["url"], name: "index_yp_garoon_people_on_url", using: :btree
    t.index ["version"], name: "index_yp_garoon_people_on_version", using: :btree
  end

  create_table "yp_ldap_people", force: :cascade do |t|
    t.string   "dn",              null: false
    t.string   "sn",              null: false
    t.string   "cn",              null: false
    t.string   "telephoneNumber"
    t.string   "description"
    t.string   "title"
    t.string   "displayName"
    t.string   "givenName"
    t.string   "mail"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["cn"], name: "index_yp_ldap_people_on_cn", using: :btree
    t.index ["description"], name: "index_yp_ldap_people_on_description", using: :btree
    t.index ["displayName"], name: "index_yp_ldap_people_on_displayName", using: :btree
    t.index ["dn"], name: "index_yp_ldap_people_on_dn", unique: true, using: :btree
    t.index ["givenName"], name: "index_yp_ldap_people_on_givenName", using: :btree
    t.index ["mail"], name: "index_yp_ldap_people_on_mail", using: :btree
    t.index ["sn"], name: "index_yp_ldap_people_on_sn", using: :btree
    t.index ["telephoneNumber"], name: "index_yp_ldap_people_on_telephoneNumber", using: :btree
    t.index ["title"], name: "index_yp_ldap_people_on_title", using: :btree
  end

  add_foreign_key "memberships", "groups"
  add_foreign_key "memberships", "people"
  add_foreign_key "memberships", "titles"
  add_foreign_key "person_applications", "applications"
  add_foreign_key "person_applications", "assignments"
  add_foreign_key "person_applications", "people"
  add_foreign_key "person_computers", "assignments"
  add_foreign_key "person_computers", "computers"
  add_foreign_key "person_computers", "people"
  add_foreign_key "person_licenses", "assignments"
  add_foreign_key "person_licenses", "licenses"
  add_foreign_key "person_licenses", "people"
  add_foreign_key "yp_garoon_memberships", "yp_garoon_groups"
  add_foreign_key "yp_garoon_memberships", "yp_garoon_people"
end
