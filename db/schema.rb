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

ActiveRecord::Schema.define(version: 20140329162040) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.integer  "question_id"
    t.integer  "location_id"
    t.string   "voice_file_url"
    t.integer  "numerical_response"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "call_source"
  end

  create_table "callers", force: true do |t|
    t.boolean  "consented_to_callback"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lat"
    t.string   "long"
    t.text     "description"
    t.datetime "most_recent_activity"
  end

  create_table "notification_subscriptions", force: true do |t|
    t.string   "email"
    t.boolean  "confirmed"
    t.datetime "confirmation_sent_at"
    t.string   "auth_token"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_email_sent_at"
    t.boolean  "bulk_added"
  end

  create_table "questions", force: true do |t|
    t.string   "short_name"
    t.string   "feedback_type"
    t.string   "question_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
