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

ActiveRecord::Schema.define(version: 20151111232418) do

  create_table "bids", force: :cascade do |t|
    t.integer  "bidder_id"
    t.integer  "bidded_id"
    t.string   "bidding_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "bids", ["bidded_id"], name: "index_bids_on_bidded_id"
  add_index "bids", ["bidder_id", "bidded_id"], name: "index_bids_on_bidder_id_and_bidded_id", unique: true
  add_index "bids", ["bidder_id"], name: "index_bids_on_bidder_id"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.string   "company_name"
    t.string   "industry"
    t.string   "company_hp"
    t.string   "company_size"
    t.string   "person"
  end

  add_index "companies", ["email"], name: "index_companies_on_email", unique: true
  add_index "companies", ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true

  create_table "messages", force: :cascade do |t|
    t.string   "type"
    t.integer  "student_id"
    t.integer  "company_id"
    t.integer  "reply_to_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "read_flg",    default: false
    t.string   "sender"
  end

# Could not dump table "projects" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.integer  "age"
    t.string   "university"
    t.string   "major"
    t.integer  "graduation_year"
    t.string   "previous_company"
    t.string   "skills"
    t.string   "interests"
    t.string   "working_preference"
    t.integer  "salary"
    t.text     "introduction"
    t.string   "linkedin_hp"
    t.string   "student_image"
  end

  add_index "students", ["email"], name: "index_students_on_email", unique: true
  add_index "students", ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true

end
