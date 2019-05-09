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

ActiveRecord::Schema.define(version: 2019_05_08_184422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_applications_on_name", unique: true
  end

  create_table "macro_definitions", force: :cascade do |t|
    t.bigint "utl_file_id"
    t.text "text"
    t.string "name"
    t.integer "start"
    t.integer "end"
    t.integer "line"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["utl_file_id"], name: "index_macro_definitions_on_utl_file_id"
  end

  create_table "macro_refs", force: :cascade do |t|
    t.bigint "utl_file_id"
    t.integer "start"
    t.integer "line"
    t.text "text"
    t.text "macro_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["utl_file_id"], name: "index_macro_refs_on_utl_file_id"
  end

  create_table "newspapers", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "package_deps", force: :cascade do |t|
    t.bigint "package_id"
    t.string "dep_name"
    t.integer "dep_pkg"
    t.string "dep_version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["package_id"], name: "index_package_deps_on_package_id"
  end

  create_table "package_props", force: :cascade do |t|
    t.bigint "package_id"
    t.string "key"
    t.text "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["package_id"], name: "index_package_props_on_package_id"
  end

  create_table "packages", force: :cascade do |t|
    t.string "name"
    t.string "version"
    t.boolean "is_certified"
    t.bigint "application_id"
    t.datetime "last_download"
    t.text "disk_directory"
    t.bigint "townnews_site_id"
    t.string "pkg_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_id"], name: "index_packages_on_application_id"
    t.index ["townnews_site_id"], name: "index_packages_on_townnews_site_id"
  end

  create_table "townnews_site_meta_data", force: :cascade do |t|
    t.bigint "townnews_site_id"
    t.string "pkg_name"
    t.text "zip_name"
    t.string "version"
    t.boolean "is_certified"
    t.datetime "last_download"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["townnews_site_id"], name: "index_townnews_site_meta_data_on_townnews_site_id"
  end

  create_table "townnews_sites", force: :cascade do |t|
    t.string "URL"
    t.string "name"
    t.bigint "newspaper_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["URL"], name: "index_townnews_sites_on_URL", unique: true
    t.index ["newspaper_id"], name: "index_townnews_sites_on_newspaper_id"
  end

  create_table "utl_files", force: :cascade do |t|
    t.text "file_path"
    t.bigint "package_id"
    t.text "file_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["package_id"], name: "index_utl_files_on_package_id"
  end

  add_foreign_key "macro_definitions", "utl_files"
  add_foreign_key "macro_refs", "utl_files"
  add_foreign_key "package_deps", "packages"
  add_foreign_key "package_props", "packages"
  add_foreign_key "packages", "applications"
  add_foreign_key "packages", "townnews_sites"
  add_foreign_key "townnews_site_meta_data", "townnews_sites"
  add_foreign_key "townnews_sites", "newspapers"
  add_foreign_key "utl_files", "packages"
end
