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

ActiveRecord::Schema.define(version: 20160711130135) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "address_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "address_types", ["user_id"], name: "index_address_types_on_user_id", using: :btree

  create_table "bank_accounts", force: :cascade do |t|
    t.string   "name"
    t.string   "number"
    t.integer  "iban"
    t.integer  "bank_id"
    t.integer  "currency_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "bank_accounts", ["bank_id"], name: "index_bank_accounts_on_bank_id", using: :btree
  add_index "bank_accounts", ["currency_id"], name: "index_bank_accounts_on_currency_id", using: :btree
  add_index "bank_accounts", ["user_id"], name: "index_bank_accounts_on_user_id", using: :btree

  create_table "banks", force: :cascade do |t|
    t.string   "name"
    t.integer  "code"
    t.integer  "swift"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "banks", ["user_id"], name: "index_banks_on_user_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "postal_code", null: false
    t.integer  "country_id"
    t.integer  "province_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "cities", ["country_id"], name: "index_cities_on_country_id", using: :btree
  add_index "cities", ["province_id"], name: "index_cities_on_province_id", using: :btree
  add_index "cities", ["user_id"], name: "index_cities_on_user_id", using: :btree

  create_table "city_parts", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "postal_code", null: false
    t.integer  "city_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "city_parts", ["city_id"], name: "index_city_parts_on_city_id", using: :btree
  add_index "city_parts", ["user_id"], name: "index_city_parts_on_user_id", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "countries", ["user_id"], name: "index_countries_on_user_id", using: :btree

  create_table "currencies", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "currencies", ["user_id"], name: "index_currencies_on_user_id", using: :btree

  create_table "exchange_rates", force: :cascade do |t|
    t.float    "rate"
    t.date     "date"
    t.integer  "bank_id"
    t.integer  "currency_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "exchange_rates", ["bank_id"], name: "index_exchange_rates_on_bank_id", using: :btree
  add_index "exchange_rates", ["currency_id"], name: "index_exchange_rates_on_currency_id", using: :btree
  add_index "exchange_rates", ["user_id"], name: "index_exchange_rates_on_user_id", using: :btree

  create_table "inbills", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "inbills", ["user_id"], name: "index_inbills_on_user_id", using: :btree

  create_table "outbills", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "outbills", ["user_id"], name: "index_outbills_on_user_id", using: :btree

  create_table "payment_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "payment_types", ["user_id"], name: "index_payment_types_on_user_id", using: :btree

  create_table "provinces", force: :cascade do |t|
    t.string   "name"
    t.integer  "country_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "provinces", ["country_id"], name: "index_provinces_on_country_id", using: :btree
  add_index "provinces", ["user_id"], name: "index_provinces_on_user_id", using: :btree

  create_table "report_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "report_types", ["user_id"], name: "index_report_types_on_user_id", using: :btree

  create_table "reports", force: :cascade do |t|
    t.date     "date"
    t.float    "to_pay"
    t.float    "to_receive"
    t.integer  "report_type_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "reports", ["report_type_id"], name: "index_reports_on_report_type_id", using: :btree
  add_index "reports", ["user_id"], name: "index_reports_on_user_id", using: :btree

  create_table "streets", force: :cascade do |t|
    t.string   "name",         null: false
    t.integer  "city_id"
    t.integer  "city_part_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "streets", ["city_id"], name: "index_streets_on_city_id", using: :btree
  add_index "streets", ["city_part_id"], name: "index_streets_on_city_part_id", using: :btree
  add_index "streets", ["user_id"], name: "index_streets_on_user_id", using: :btree

  create_table "table_addressLinks", force: :cascade do |t|
    t.integer  "addressType_id", default: 1, null: false
    t.integer  "houseNumber_id",             null: false
    t.integer  "user_id",                    null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "table_dayEntries", force: :cascade do |t|
    t.integer  "task_id",                    null: false
    t.date     "date"
    t.time     "start"
    t.time     "stop"
    t.boolean  "invoiced",   default: false
    t.integer  "user_id",                    null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "table_houseNumbers", force: :cascade do |t|
    t.integer  "house_number", null: false
    t.integer  "city_id"
    t.integer  "street_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "table_ininvoiceItems", force: :cascade do |t|
    t.integer  "ininvoice_id", null: false
    t.integer  "item_id",      null: false
    t.float    "amount",       null: false
    t.text     "note"
    t.integer  "user_id",      null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "table_ininvoicePayments", force: :cascade do |t|
    t.float    "amount",          default: 0.0, null: false
    t.integer  "payment_id",                    null: false
    t.integer  "ininvoice_id",                  null: false
    t.integer  "exchangeRate_id",               null: false
    t.integer  "user_id",                       null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "table_items", force: :cascade do |t|
    t.string   "name",            null: false
    t.text     "description"
    t.float    "unit_price"
    t.integer  "currency_id",     null: false
    t.integer  "vat_id",          null: false
    t.integer  "tradeSubject_id", null: false
    t.integer  "user_id",         null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "table_outinvoiceItems", force: :cascade do |t|
    t.integer  "outinvoice_id", null: false
    t.integer  "item_id",       null: false
    t.float    "amount",        null: false
    t.text     "note"
    t.integer  "user_id",       null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "table_outinvoicePayments", force: :cascade do |t|
    t.float    "amount",          default: 0.0, null: false
    t.integer  "payment_id",                    null: false
    t.integer  "outinvoice_id",                 null: false
    t.integer  "exchangeRate_id",               null: false
    t.integer  "user_id",                       null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "table_payments", force: :cascade do |t|
    t.date     "date",                          null: false
    t.float    "amount",          default: 0.0, null: false
    t.integer  "typePayment_id",                null: false
    t.integer  "currency_id",                   null: false
    t.integer  "bankAccount_id",                null: false
    t.integer  "tradeSubject_id",               null: false
    t.integer  "vatReport_id",                  null: false
    t.integer  "incomeReport_id",               null: false
    t.integer  "user_id",                       null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "table_projects", force: :cascade do |t|
    t.integer  "tradeSubject_id", null: false
    t.string   "name",            null: false
    t.text     "note"
    t.integer  "user_id",         null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "table_taskTypes", force: :cascade do |t|
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

  create_table "table_tradeSubjects", force: :cascade do |t|
    t.string   "name",                  null: false
    t.integer  "identification_number", null: false
    t.integer  "VAT"
    t.integer  "user_id",               null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "table_vatCharges", force: :cascade do |t|
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

  add_foreign_key "address_types", "users"
  add_foreign_key "bank_accounts", "banks"
  add_foreign_key "bank_accounts", "currencies"
  add_foreign_key "bank_accounts", "users"
  add_foreign_key "banks", "users"
  add_foreign_key "cities", "countries"
  add_foreign_key "cities", "provinces"
  add_foreign_key "cities", "users"
  add_foreign_key "city_parts", "cities"
  add_foreign_key "city_parts", "users"
  add_foreign_key "countries", "users"
  add_foreign_key "currencies", "users"
  add_foreign_key "exchange_rates", "banks"
  add_foreign_key "exchange_rates", "currencies"
  add_foreign_key "exchange_rates", "users"
  add_foreign_key "inbills", "users"
  add_foreign_key "outbills", "users"
  add_foreign_key "payment_types", "users"
  add_foreign_key "provinces", "countries"
  add_foreign_key "provinces", "users"
  add_foreign_key "report_types", "users"
  add_foreign_key "reports", "report_types"
  add_foreign_key "reports", "users"
  add_foreign_key "streets", "cities"
  add_foreign_key "streets", "city_parts"
  add_foreign_key "streets", "users"
end
