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

ActiveRecord::Schema.define(version: 20150827041120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_salesforces", force: :cascade do |t|
    t.string   "username",       limit: 100
    t.string   "password",       limit: 100
    t.string   "client_id",      limit: 200
    t.string   "client_secret",  limit: 200
    t.string   "security_token", limit: 200
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "leads", force: :cascade do |t|
    t.string   "name",                  limit: 50
    t.string   "last_name",             limit: 50
    t.string   "email",                 limit: 100
    t.string   "company",               limit: 100
    t.string   "job_title",             limit: 100
    t.string   "phone",                 limit: 50
    t.string   "website",               limit: 100
    t.string   "salesforce_id",         limit: 50
    t.datetime "salesforce_updated_at"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

end
