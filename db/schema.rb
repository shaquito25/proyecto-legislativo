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

ActiveRecord::Schema[7.0].define(version: 2022_11_27_124944) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "expedients", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "person_type"
    t.date "birth_date"
    t.integer "request_quantity"
    t.string "document"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "perfil_id", null: false
    t.string "request_type"
    t.index ["perfil_id"], name: "index_expedients_on_perfil_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.integer "med"
    t.integer "ct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "expedients", "perfils"
  add_foreign_key "users", "perfils"
end
