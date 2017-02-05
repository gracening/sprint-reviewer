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

ActiveRecord::Schema.define(version: 20170205090745) do

  create_table "bad", primary_key: "ID", force: :cascade do |t|
    t.string "AUTHOR", limit: 50,  null: false
    t.string "DATE",   limit: 50,  null: false
    t.string "BODY",   limit: 200, null: false
    t.string "TEAM",   limit: 50
    t.index ["ID"], name: "sqlite_autoindex_bad_1", unique: true
  end

  create_table "bads", id: false, force: :cascade do |t|
    t.integer  "id"
    t.string   "author"
    t.string   "date"
    t.string   "body"
    t.string   "team"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "good", primary_key: "ID", force: :cascade do |t|
    t.string "AUTHOR", limit: 50,  null: false
    t.string "DATE",   limit: 50,  null: false
    t.string "BODY",   limit: 200, null: false
    t.string "TEAM",   limit: 50
    t.index ["ID"], name: "sqlite_autoindex_good_1", unique: true
  end

  create_table "goods", id: false, force: :cascade do |t|
    t.integer  "id"
    t.string   "author"
    t.string   "date"
    t.string   "body"
    t.string   "team"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "improve", primary_key: "ID", force: :cascade do |t|
    t.string "AUTHOR", limit: 50,  null: false
    t.string "DATE",   limit: 50,  null: false
    t.string "BODY",   limit: 200, null: false
    t.string "TEAM",   limit: 50
    t.index ["ID"], name: "sqlite_autoindex_improve_1", unique: true
  end

  create_table "improves", id: false, force: :cascade do |t|
    t.integer  "id"
    t.string   "author"
    t.string   "date"
    t.string   "body"
    t.string   "team"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
