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

ActiveRecord::Schema.define(version: 20140305050858) do

  create_table "grocery_list_items", force: true do |t|
    t.integer  "grocery_list_id"
    t.integer  "item_id"
    t.boolean  "bought",                                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",           precision: 6, scale: 2, default: 0.0
  end

  add_index "grocery_list_items", ["grocery_list_id", "bought"], name: "index_grocery_list_items_on_grocery_list_id_and_bought"

  create_table "grocery_lists", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "complete",   default: false
  end

  add_index "grocery_lists", ["complete"], name: "index_grocery_lists_on_complete"
  add_index "grocery_lists", ["created_at"], name: "index_grocery_lists_on_created_at"
  add_index "grocery_lists", ["name"], name: "index_grocery_lists_on_name", unique: true
  add_index "grocery_lists", ["user_id"], name: "index_grocery_lists_on_user_id"

  create_table "items", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["name"], name: "index_items_on_name", unique: true

  create_table "prices", force: true do |t|
    t.string   "item_id"
    t.decimal  "avg",        precision: 6, scale: 2, default: 0.0
    t.decimal  "max",        precision: 6, scale: 2, default: 0.0
    t.decimal  "min",        precision: 6, scale: 2, default: 0.0
    t.decimal  "total",      precision: 6, scale: 2, default: 0.0
    t.integer  "count",                              default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prices", ["item_id"], name: "index_prices_on_item_id", unique: true

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
