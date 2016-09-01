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

ActiveRecord::Schema.define(version: 20160901152051) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "address_links", force: :cascade do |t|
    t.integer  "address_type_id"
    t.integer  "house_number_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "address_links", ["address_type_id"], name: "index_address_links_on_address_type_id", using: :btree
  add_index "address_links", ["house_number_id"], name: "index_address_links_on_house_number_id", using: :btree
  add_index "address_links", ["user_id"], name: "index_address_links_on_user_id", using: :btree

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
    t.string   "iban"
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
    t.string   "code"
    t.string   "swift"
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

  create_table "day_entries", force: :cascade do |t|
    t.date     "date"
    t.time     "start"
    t.time     "stop"
    t.boolean  "invoiced"
    t.integer  "task_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "day_entries", ["task_id"], name: "index_day_entries_on_task_id", using: :btree
  add_index "day_entries", ["user_id"], name: "index_day_entries_on_user_id", using: :btree

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

  create_table "house_numbers", force: :cascade do |t|
    t.string   "house_number", null: false
    t.integer  "city_id"
    t.integer  "street_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "house_numbers", ["city_id"], name: "index_house_numbers_on_city_id", using: :btree
  add_index "house_numbers", ["street_id"], name: "index_house_numbers_on_street_id", using: :btree
  add_index "house_numbers", ["user_id"], name: "index_house_numbers_on_user_id", using: :btree

  create_table "income_reports", force: :cascade do |t|
    t.integer  "number"
    t.date     "date"
    t.float    "to_pay"
    t.float    "to_receive"
    t.text     "note"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "income_reports", ["user_id"], name: "index_income_reports_on_user_id", using: :btree

  create_table "incomming_invoice_items", force: :cascade do |t|
    t.float    "amount"
    t.text     "note"
    t.integer  "incomming_invoice_id"
    t.integer  "item_id"
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "incomming_invoice_items", ["incomming_invoice_id"], name: "index_incomming_invoice_items_on_incomming_invoice_id", using: :btree
  add_index "incomming_invoice_items", ["item_id"], name: "index_incomming_invoice_items_on_item_id", using: :btree
  add_index "incomming_invoice_items", ["user_id"], name: "index_incomming_invoice_items_on_user_id", using: :btree

  create_table "incomming_invoice_payments", force: :cascade do |t|
    t.float    "amount"
    t.integer  "payment_id"
    t.integer  "incomming_invoice_id"
    t.integer  "exchange_rate_id"
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "incomming_invoice_payments", ["exchange_rate_id"], name: "index_incomming_invoice_payments_on_exchange_rate_id", using: :btree
  add_index "incomming_invoice_payments", ["incomming_invoice_id"], name: "index_incomming_invoice_payments_on_incomming_invoice_id", using: :btree
  add_index "incomming_invoice_payments", ["payment_id"], name: "index_incomming_invoice_payments_on_payment_id", using: :btree
  add_index "incomming_invoice_payments", ["user_id"], name: "index_incomming_invoice_payments_on_user_id", using: :btree

  create_table "incomming_invoice_sequences", force: :cascade do |t|
    t.string   "name"
    t.text     "note"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "incomming_invoice_sequences", ["user_id"], name: "index_incomming_invoice_sequences_on_user_id", using: :btree

  create_table "incomming_invoices", force: :cascade do |t|
    t.integer  "number"
    t.date     "generated_on_date"
    t.date     "taxable_supply_date"
    t.date     "due_date"
    t.float    "total_computed_base"
    t.float    "total_computed_vat"
    t.float    "total_corrected_base"
    t.float    "total_corrected_vat"
    t.boolean  "reverse_charge"
    t.boolean  "paid"
    t.text     "note"
    t.binary   "original_invoice"
    t.string   "original_invoice_md5"
    t.binary   "translated_invoice"
    t.string   "translated_invoice_md5"
    t.integer  "incomming_invoice_sequence_id"
    t.integer  "trade_subject_id"
    t.integer  "currency_id"
    t.integer  "exchange_rate_id"
    t.integer  "user_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "incomming_invoices", ["currency_id"], name: "index_incomming_invoices_on_currency_id", using: :btree
  add_index "incomming_invoices", ["exchange_rate_id"], name: "index_incomming_invoices_on_exchange_rate_id", using: :btree
  add_index "incomming_invoices", ["incomming_invoice_sequence_id"], name: "index_incomming_invoices_on_incomming_invoice_sequence_id", using: :btree
  add_index "incomming_invoices", ["trade_subject_id"], name: "index_incomming_invoices_on_trade_subject_id", using: :btree
  add_index "incomming_invoices", ["user_id"], name: "index_incomming_invoices_on_user_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.text     "note"
    t.float    "unit_price"
    t.integer  "currency_id"
    t.integer  "vat_charge_id"
    t.integer  "trade_subject_id"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "items", ["currency_id"], name: "index_items_on_currency_id", using: :btree
  add_index "items", ["trade_subject_id"], name: "index_items_on_trade_subject_id", using: :btree
  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree
  add_index "items", ["vat_charge_id"], name: "index_items_on_vat_charge_id", using: :btree

  create_table "outgoing_invoice_items", force: :cascade do |t|
    t.float    "amount"
    t.text     "note"
    t.integer  "outgoing_invoice_id"
    t.integer  "item_id"
    t.integer  "user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "outgoing_invoice_items", ["item_id"], name: "index_outgoing_invoice_items_on_item_id", using: :btree
  add_index "outgoing_invoice_items", ["outgoing_invoice_id"], name: "index_outgoing_invoice_items_on_outgoing_invoice_id", using: :btree
  add_index "outgoing_invoice_items", ["user_id"], name: "index_outgoing_invoice_items_on_user_id", using: :btree

  create_table "outgoing_invoice_payments", force: :cascade do |t|
    t.float    "amount"
    t.integer  "payment_id"
    t.integer  "outgoing_invoice_id"
    t.integer  "exchange_rate_id"
    t.integer  "user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "outgoing_invoice_payments", ["exchange_rate_id"], name: "index_outgoing_invoice_payments_on_exchange_rate_id", using: :btree
  add_index "outgoing_invoice_payments", ["outgoing_invoice_id"], name: "index_outgoing_invoice_payments_on_outgoing_invoice_id", using: :btree
  add_index "outgoing_invoice_payments", ["payment_id"], name: "index_outgoing_invoice_payments_on_payment_id", using: :btree
  add_index "outgoing_invoice_payments", ["user_id"], name: "index_outgoing_invoice_payments_on_user_id", using: :btree

  create_table "outgoing_invoice_sequences", force: :cascade do |t|
    t.string   "name"
    t.text     "note"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "outgoing_invoice_sequences", ["user_id"], name: "index_outgoing_invoice_sequences_on_user_id", using: :btree

  create_table "outgoing_invoices", force: :cascade do |t|
    t.integer  "number"
    t.date     "generated_on_date"
    t.date     "taxable_supply_date"
    t.date     "due_date"
    t.float    "total_computed_base"
    t.float    "total_computed_vat"
    t.float    "total_corrected_base"
    t.float    "total_corrected_vat"
    t.boolean  "reverse_charge"
    t.boolean  "paid"
    t.text     "note"
    t.binary   "original_invoice"
    t.string   "original_invoice_md5"
    t.binary   "translated_invoice"
    t.string   "translated_invoice_md5"
    t.integer  "outgoing_invoice_sequence_id"
    t.integer  "trade_subject_id"
    t.integer  "currency_id"
    t.integer  "exchange_rate_id"
    t.integer  "user_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "outgoing_invoices", ["currency_id"], name: "index_outgoing_invoices_on_currency_id", using: :btree
  add_index "outgoing_invoices", ["exchange_rate_id"], name: "index_outgoing_invoices_on_exchange_rate_id", using: :btree
  add_index "outgoing_invoices", ["outgoing_invoice_sequence_id"], name: "index_outgoing_invoices_on_outgoing_invoice_sequence_id", using: :btree
  add_index "outgoing_invoices", ["trade_subject_id"], name: "index_outgoing_invoices_on_trade_subject_id", using: :btree
  add_index "outgoing_invoices", ["user_id"], name: "index_outgoing_invoices_on_user_id", using: :btree

  create_table "payment_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "payment_types", ["user_id"], name: "index_payment_types_on_user_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.date     "date"
    t.float    "amount"
    t.text     "note"
    t.integer  "payment_type_id"
    t.integer  "currency_id"
    t.integer  "bank_account_id"
    t.integer  "trade_subject_id"
    t.integer  "vat_report_id"
    t.integer  "income_report_id"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "payments", ["bank_account_id"], name: "index_payments_on_bank_account_id", using: :btree
  add_index "payments", ["currency_id"], name: "index_payments_on_currency_id", using: :btree
  add_index "payments", ["income_report_id"], name: "index_payments_on_income_report_id", using: :btree
  add_index "payments", ["payment_type_id"], name: "index_payments_on_payment_type_id", using: :btree
  add_index "payments", ["trade_subject_id"], name: "index_payments_on_trade_subject_id", using: :btree
  add_index "payments", ["user_id"], name: "index_payments_on_user_id", using: :btree
  add_index "payments", ["vat_report_id"], name: "index_payments_on_vat_report_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name",             null: false
    t.text     "note"
    t.integer  "trade_subject_id"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "projects", ["trade_subject_id"], name: "index_projects_on_trade_subject_id", using: :btree
  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

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

  create_table "task_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "task_types", ["user_id"], name: "index_task_types_on_user_id", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "link"
    t.text     "note"
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tasks", ["project_id"], name: "index_tasks_on_project_id", using: :btree
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id", using: :btree

  create_table "trade_subjects", force: :cascade do |t|
    t.string   "name",                  null: false
    t.integer  "identification_number", null: false
    t.string   "vat",                   null: false
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "trade_subjects", ["user_id"], name: "index_trade_subjects_on_user_id", using: :btree

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
    t.string   "street"
    t.string   "trade_subject"
    t.string   "identification_number"
    t.string   "vat"
    t.string   "house_number"
    t.string   "city_part"
    t.string   "city"
    t.string   "postal_code"
    t.string   "province"
    t.string   "country"
    t.string   "phone"
    t.string   "mail"
    t.string   "web"
    t.text     "note"
    t.string   "bank"
    t.string   "bank_account"
    t.string   "iban"
    t.string   "swift"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vat_charges", force: :cascade do |t|
    t.float    "percentage", null: false
    t.integer  "country_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "vat_charges", ["country_id"], name: "index_vat_charges_on_country_id", using: :btree
  add_index "vat_charges", ["user_id"], name: "index_vat_charges_on_user_id", using: :btree

  create_table "vat_reports", force: :cascade do |t|
    t.integer  "number"
    t.date     "date"
    t.float    "to_pay"
    t.float    "to_receive"
    t.text     "note"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "vat_reports", ["user_id"], name: "index_vat_reports_on_user_id", using: :btree

  add_foreign_key "address_links", "address_types"
  add_foreign_key "address_links", "house_numbers"
  add_foreign_key "address_links", "users"
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
  add_foreign_key "day_entries", "tasks"
  add_foreign_key "day_entries", "users"
  add_foreign_key "exchange_rates", "banks"
  add_foreign_key "exchange_rates", "currencies"
  add_foreign_key "exchange_rates", "users"
  add_foreign_key "house_numbers", "cities"
  add_foreign_key "house_numbers", "streets"
  add_foreign_key "house_numbers", "users"
  add_foreign_key "income_reports", "users"
  add_foreign_key "incomming_invoice_items", "incomming_invoices"
  add_foreign_key "incomming_invoice_items", "items"
  add_foreign_key "incomming_invoice_items", "users"
  add_foreign_key "incomming_invoice_payments", "exchange_rates"
  add_foreign_key "incomming_invoice_payments", "incomming_invoices"
  add_foreign_key "incomming_invoice_payments", "payments"
  add_foreign_key "incomming_invoice_payments", "users"
  add_foreign_key "incomming_invoice_sequences", "users"
  add_foreign_key "incomming_invoices", "currencies"
  add_foreign_key "incomming_invoices", "exchange_rates"
  add_foreign_key "incomming_invoices", "incomming_invoice_sequences"
  add_foreign_key "incomming_invoices", "trade_subjects"
  add_foreign_key "incomming_invoices", "users"
  add_foreign_key "items", "currencies"
  add_foreign_key "items", "trade_subjects"
  add_foreign_key "items", "users"
  add_foreign_key "items", "vat_charges"
  add_foreign_key "outgoing_invoice_items", "items"
  add_foreign_key "outgoing_invoice_items", "outgoing_invoices"
  add_foreign_key "outgoing_invoice_items", "users"
  add_foreign_key "outgoing_invoice_payments", "exchange_rates"
  add_foreign_key "outgoing_invoice_payments", "outgoing_invoices"
  add_foreign_key "outgoing_invoice_payments", "payments"
  add_foreign_key "outgoing_invoice_payments", "users"
  add_foreign_key "outgoing_invoice_sequences", "users"
  add_foreign_key "outgoing_invoices", "currencies"
  add_foreign_key "outgoing_invoices", "exchange_rates"
  add_foreign_key "outgoing_invoices", "outgoing_invoice_sequences"
  add_foreign_key "outgoing_invoices", "trade_subjects"
  add_foreign_key "outgoing_invoices", "users"
  add_foreign_key "payment_types", "users"
  add_foreign_key "payments", "bank_accounts"
  add_foreign_key "payments", "currencies"
  add_foreign_key "payments", "income_reports"
  add_foreign_key "payments", "payment_types"
  add_foreign_key "payments", "trade_subjects"
  add_foreign_key "payments", "users"
  add_foreign_key "payments", "vat_reports"
  add_foreign_key "projects", "trade_subjects"
  add_foreign_key "projects", "users"
  add_foreign_key "provinces", "countries"
  add_foreign_key "provinces", "users"
  add_foreign_key "report_types", "users"
  add_foreign_key "reports", "report_types"
  add_foreign_key "reports", "users"
  add_foreign_key "streets", "cities"
  add_foreign_key "streets", "city_parts"
  add_foreign_key "streets", "users"
  add_foreign_key "task_types", "users"
  add_foreign_key "tasks", "projects"
  add_foreign_key "tasks", "users"
  add_foreign_key "trade_subjects", "users"
  add_foreign_key "vat_charges", "countries"
  add_foreign_key "vat_charges", "users"
  add_foreign_key "vat_reports", "users"
end
