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

ActiveRecord::Schema.define(version: 20160706164033) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "foos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inbills", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id",    null: false
  end

  create_table "outbills", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "user_id",    null: false
  end

  create_table "table_address_links", force: :cascade do |t|
    t.integer  "address_type__id", default: 1, null: false
    t.integer  "house_number__id",             null: false
    t.integer  "user_id",                      null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "table_address_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "table_bank_accounts", force: :cascade do |t|
    t.string   "name"
    t.string   "number",      null: false
    t.integer  "IBAN"
    t.integer  "bank_id",     null: false
    t.integer  "currency_id", null: false
    t.integer  "user_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "table_banks", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "code",       null: false
    t.integer  "IBAN"
    t.integer  "SWIFT"
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "table_citi_parts", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "postal_code", null: false
    t.integer  "city_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "table_cities", force: :cascade do |t|
    t.string   "name",                    null: false
    t.string   "postal_code",             null: false
    t.integer  "country_id",  default: 1, null: false
    t.integer  "province_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "table_countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "table_currencies", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "table_day_entries", force: :cascade do |t|
    t.integer  "task_id",                    null: false
    t.date     "date"
    t.time     "start"
    t.time     "stop"
    t.boolean  "invoiced",   default: false
    t.integer  "user_id",                    null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "table_exchange_rates", force: :cascade do |t|
    t.float    "rate"
    t.integer  "bank_id",     null: false
    t.integer  "currency_id", null: false
    t.date     "date"
    t.integer  "user_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "table_house_numbers", force: :cascade do |t|
    t.integer  "house_number", null: false
    t.integer  "city_id"
    t.integer  "street_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "table_ininvoice_items", force: :cascade do |t|
    t.integer  "ininvoice_id", null: false
    t.integer  "item_id",      null: false
    t.float    "amount",       null: false
    t.text     "note"
    t.integer  "user_id",      null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "table_ininvoice_payments", force: :cascade do |t|
    t.float    "amount",           default: 0.0, null: false
    t.integer  "payment_id",                     null: false
    t.integer  "ininvoice_id",                   null: false
    t.integer  "exchange_rate_id",               null: false
    t.integer  "user_id",                        null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "table_items", force: :cascade do |t|
    t.string   "name",             null: false
    t.text     "description"
    t.float    "unit_price"
    t.integer  "currency_id",      null: false
    t.integer  "vat_id",           null: false
    t.integer  "trade_subject_id", null: false
    t.integer  "user_id",          null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "table_outinvoice_items", force: :cascade do |t|
    t.integer  "outinvoice_id", null: false
    t.integer  "item_id",       null: false
    t.float    "amount",        null: false
    t.text     "note"
    t.integer  "user_id",       null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "table_outinvoice_payments", force: :cascade do |t|
    t.float    "amount",           default: 0.0, null: false
    t.integer  "payment_id",                     null: false
    t.integer  "outinvoice_id",                  null: false
    t.integer  "exchange_rate_id",               null: false
    t.integer  "user_id",                        null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "table_payment_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "table_payments", force: :cascade do |t|
    t.date     "date",                           null: false
    t.float    "amount",           default: 0.0, null: false
    t.integer  "type_payment_id",                null: false
    t.integer  "currency_id",                    null: false
    t.integer  "bank_account_id",                null: false
    t.integer  "trade_subject_id",               null: false
    t.integer  "vat_report_id",                  null: false
    t.integer  "income_report_id",               null: false
    t.integer  "user_id",                        null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "table_projects", force: :cascade do |t|
    t.integer  "trade_subject_id", null: false
    t.string   "name",             null: false
    t.text     "note"
    t.integer  "user_id",          null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "table_provinces", force: :cascade do |t|
    t.string   "name"
    t.integer  "country_id", default: 1, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "table_report_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "table_reports", force: :cascade do |t|
    t.date    "date",           null: false
    t.integer "report_type_id", null: false
    t.float   "to_pay"
    t.float   "to_receive"
  end

  create_table "table_streets", force: :cascade do |t|
    t.string   "name",         null: false
    t.integer  "city_id",      null: false
    t.integer  "city_part_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "table_task_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "table_tasks", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "project_id", null: false
    t.string   "link"
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "table_trade_subjects", force: :cascade do |t|
    t.string   "name",                  null: false
    t.integer  "identification_number", null: false
    t.integer  "VAT"
    t.integer  "user_id",               null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "table_vat_charges", force: :cascade do |t|
    t.integer  "country_id", null: false
    t.float    "percentage", null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
