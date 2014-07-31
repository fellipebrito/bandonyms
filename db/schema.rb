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

ActiveRecord::Schema.define(version: 20140730072550) do

  create_table "answers", force: true do |t|
    t.string "title"
  end

  create_table "clues", force: true do |t|
    t.integer "answer_id"
    t.string  "title"
  end

  add_index "clues", ["answer_id"], name: "index_clues_on_answer_id", using: :btree

  create_table "matches", force: true do |t|
    t.integer  "user_id"
    t.integer  "answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "matches", ["answer_id"], name: "index_matches_on_answer_id", using: :btree
  add_index "matches", ["user_id"], name: "index_matches_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.integer "facebook_id"
    t.string  "access_token"
    t.string  "name"
    t.string  "gender"
    t.string  "link"
  end

end
