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

ActiveRecord::Schema[7.0].define(version: 2022_10_25_161548) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "attachment_instances", force: :cascade do |t|
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "attachment_id", null: false
    t.index ["attachment_id"], name: "index_attachment_instances_on_attachment_id"
    t.index ["user_id"], name: "index_attachment_instances_on_user_id"
  end

  create_table "attachments", force: :cascade do |t|
    t.boolean "active"
    t.string "code"
    t.boolean "mandatory"
    t.string "name"
    t.string "tipo_persona"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expedients", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "person_type"
    t.string "age"
    t.date "birth_date"
    t.integer "request_quantity"
    t.string "document"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "perfil_id", null: false
    t.string "request_type"
    t.index ["perfil_id"], name: "index_expedients_on_perfil_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.integer "medicine_quantity"
    t.integer "construction_quantity"
    t.integer "total_quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "expedient_id", null: false
    t.index ["expedient_id"], name: "index_inventories_on_expedient_id"
  end

  create_table "perfils", force: :cascade do |t|
    t.string "nombre"
    t.string "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "perfil_id", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["perfil_id"], name: "index_users_on_perfil_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "attachment_instances", "attachments"
  add_foreign_key "attachment_instances", "users"
  add_foreign_key "expedients", "perfils"
  add_foreign_key "inventories", "expedients"
  add_foreign_key "users", "perfils"
end
