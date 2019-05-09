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
    t.bigint "utl_file_id", null: false
    t.text "text"
    t.string "name", null: false
    t.integer "start", null: false
    t.integer "end"
    t.integer "line"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_macro_definitions_on_name"
    t.index ["utl_file_id", "start"], name: "index_macro_definitions_on_utl_file_id_and_start", unique: true
    t.index ["utl_file_id"], name: "index_macro_definitions_on_utl_file_id"
  end

  create_table "macro_refs", force: :cascade do |t|
    t.bigint "utl_file_id", null: false
    t.integer "start", null: false
    t.integer "line"
    t.text "text"
    t.text "macro_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["utl_file_id", "start", "macro_name"], name: "index_macro_refs_on_utl_file_id_and_start_and_macro_name", unique: true
    t.index ["utl_file_id"], name: "index_macro_refs_on_utl_file_id"
  end

  create_table "newspapers", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_newspapers_on_name", unique: true
  end

  create_table "package_deps", force: :cascade do |t|
    t.bigint "package_id", null: false
    t.string "dep_name"
    t.integer "dep_pkg", null: false
    t.string "dep_version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dep_name"], name: "index_package_deps_on_dep_name"
    t.index ["dep_pkg"], name: "index_package_deps_on_dep_pkg"
    t.index ["package_id"], name: "index_package_deps_on_package_id"
  end

  create_table "package_props", force: :cascade do |t|
    t.bigint "package_id", null: false
    t.string "key", null: false
    t.text "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["package_id", "key"], name: "index_package_props_on_package_id_and_key", unique: true
    t.index ["package_id"], name: "index_package_props_on_package_id"
  end

  create_table "packages", force: :cascade do |t|
    t.string "name", null: false
    t.string "version"
    t.boolean "is_certified"
    t.bigint "application_id"
    t.datetime "last_download"
    t.text "disk_directory"
    t.bigint "townnews_site_id"
    t.string "pkg_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_id"], name: "index_packages_on_application_id"
    t.index ["last_download"], name: "index_packages_on_last_download"
    t.index ["townnews_site_id"], name: "index_packages_on_townnews_site_id"
    t.index ["version"], name: "index_packages_on_version"
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
    t.index ["townnews_site_id", "pkg_name", "version", "last_download"], name: "index_tnsmd_primary_key", unique: true
    t.index ["townnews_site_id"], name: "index_townnews_site_meta_data_on_townnews_site_id"
  end

  create_table "townnews_sites", force: :cascade do |t|
    t.string "URL", null: false
    t.string "name"
    t.bigint "newspaper_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["URL"], name: "index_townnews_sites_on_URL", unique: true
    t.index ["newspaper_id"], name: "index_townnews_sites_on_newspaper_id"
  end

  create_table "utl_files", force: :cascade do |t|
    t.text "file_path", null: false
    t.bigint "package_id"
    t.text "file_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["package_id", "file_path"], name: "index_utl_files_on_package_id_and_file_path", unique: true
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
